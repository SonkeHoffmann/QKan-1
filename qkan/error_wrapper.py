"""Wrapper und Hilfsfunktionen für schrittweise Fehlerbehandlungs-Migration.

Dieses Modul ermöglicht es, alte Code-Stellen mit neuer Fehlerbehandlung
zu versehen, ohne den alten Code selbst zu ändern.

Verwendung:
  1. @wrap_handler für Funktionen, die noch generische Exceptions werfen
  2. @error_boundary für UI-Handler/Dialog-Grenzen
  3. ErrorContext für funktionsspezifische Kontexte
"""

from __future__ import annotations

import functools
from typing import Callable, TypeVar, Any, Optional

from qkan.utils import (
    QkanError,
    QkanUserError,
    QkanDbError,
    QkanAbortError,
    get_logger,
)
from qkan.error_dispatcher import global_error

logger = get_logger("QKan.error_wrapper")

F = TypeVar("F", bound=Callable[..., Any])


class ErrorContext:
    """Context Manager für funktionsspezifische Fehlerbehandlung.

    Automatisch erfasst den Funktionsnamen und andere Metadaten für bessere
    Fehlerdiagnose.

    Beispiel:
        def upload_data(server, database):
            with ErrorContext("upload_data"):
                # Ihr Code, der Exceptions werfen kann
                result = some_operation()
            return result
    """

    def __init__(self, operation: str):
        """
        Args:
            operation: Beschreibung der Operation (z.B. "Datenbankverbindung")
        """
        self.operation = operation
        self.error: Optional[Exception] = None

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Fehler abfangen und klassifizieren."""
        if exc_type is None:
            return False  # Kein Fehler

        self.error = exc_val

        # Fehler transformieren, aber nicht schlucken
        if not isinstance(exc_val, QkanError):
            logger.debug(
                f"ErrorContext({self.operation}): "
                f"Transformiere {type(exc_val).__name__} zu QkanError"
            )

        # Fehler propagiert weiter, aber wird durch globale Handler gefangen
        return False  # Re-raise exception


def wrap_handler(
    func: F, context: Optional[str] = None, reraise: bool = True
) -> F:
    """Decorator für Funktionen mit alter Exception-Behandlung.

    Transformiert Exceptions automatisch in QKAN-Fehler und loggt sie.
    Die Funktion selbst bleibt unverändert.

    Beispiel:
        @wrap_handler(context="Datenbankverbindung")
        def connect_to_db(server):
            # Code der eventuell Exception wirft
            ...

    Args:
        func: Zu wrappende Funktion
        context: Beschreibung für Fehler-Kontext
        reraise: Fehler nach Behandlung neu werfen?
    """

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        operation = context or func.__name__
        try:
            return func(*args, **kwargs)
        except QkanError:
            # Bereits ein QKAN-Fehler → nur loggen, nicht transformieren
            raise
        except Exception as e:
            # Generische Exception → in QkanError transformieren
            msg = f"{operation}: {type(e).__name__}: {e}"
            logger.error_code(msg, exc_info=e)

            # Intelligente Klassifizierung basierend auf Exception-Typ
            if isinstance(e, (ConnectionError, TimeoutError)):
                transformed = QkanDbError(str(e))
            elif isinstance(e, (ValueError, KeyError)):
                transformed = QkanUserError(str(e))
            elif "abort" in str(type(e)).lower():
                transformed = QkanAbortError(str(e))
            else:
                transformed = QkanError(str(e))

            if reraise:
                raise transformed from e
            return None

    return wrapper  # type: ignore


def error_boundary(
    func: F, context: Optional[str] = None, show_dialog: bool = True
) -> F:
    """Decorator für UI-Action-Handler und Dialog-Grenzen.

    Das ist der äußerste Fehler-Handler, der auf Benutzereingaben antwortet.
    Alle Exceptions werden gefangen, zentral behandelt und dem Nutzer angezeigt.

    Beispiel:
        @error_boundary(context="PostgreSQL-Upload")
        def on_upload_button_clicked(self):
            self.upload_postgres()
            self.show_success_message()

    Args:
        func: Handler-Funktion
        context: Beschreibung der Aktion
        show_dialog: Dialog anzeigen oder nur loggen?
    """

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        operation = context or func.__name__
        parent = None

        # Versuchen, self.iface oder ähnliches zu finden
        if args and hasattr(args[0], "iface"):
            parent = getattr(args[0].iface, "mainWindow", lambda: None)()

        try:
            return func(*args, **kwargs)

        except QkanError as e:
            # QKAN-spezifischer Fehler → über globalen Handler
            global_error.handle(
                e,
                context=operation,
                parent=parent,
                reraise=False,
                show_dialog=show_dialog,
            )
            return None

        except Exception as e:
            # Unerwarteter Fehler → auch über globalen Handler
            logger.error(f"Unerwarteter Fehler in {operation}", exc_info=True)
            global_error.handle(
                e,
                context=operation,
                parent=parent,
                reraise=False,
                show_dialog=show_dialog,
            )
            return None

    return wrapper  # type: ignore


def safe_call(
    func: Callable,
    *args,
    context: str = "Operation",
    **kwargs,
) -> Any:
    """Hilfsfunktion für sichere Funktionsaufrufe in Fachlogik.

    Wenn eine Funktion lokal eine Exception werfen kann und es nicht
    kritisch ist, kann damit gefahrlos aufgerufen werden.

    Beispiel:
        result = safe_call(
            some_function,
            arg1, arg2,
            context="Konfiguration laden"
        )
        if result is None:
            # Fehler ist bereits geloggt
            ...
    """
    try:
        return func(*args, **kwargs)
    except QkanError:
        raise  # Weiterleiten
    except Exception as e:
        logger.error_code(f"{context}: {e}", exc_info=e)
        return None
