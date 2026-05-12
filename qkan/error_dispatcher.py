"""Zentrale Fehlerbehandlung für QKan.

Struktur:
  - Fehlerklassen definieren die fachliche Bedeutung (QkanDbError, QkanUserError, etc.)
  - Handler klassifiziert und formatiert sie
  - globale Instanz `global_error` wird von UI/Dialog-Grenzen aufgerufen
  - Fachlogik wirft nur noch QKAN-Fehler, keine generischen Exceptions

Migration:
  1. Alte Exception/BaseException durch QkanError-Subklassen ersetzen
  2. Fehlerbehandlung an UI-Grenzen (Dialog, Action-Handler) zentralisieren
  3. Dort global_error.handle() aufrufen statt in jedem Modul separat
"""

from __future__ import annotations

import enum
from typing import Optional, Callable

from qkan.utils import (
    QkanError,
    QkanUserError,
    QkanDbError,
    QkanAbortError,
    get_logger,
)


class ErrorLevel(enum.Enum):
    """Klassifizierung von Fehlern für Logging und UI."""

    INFO = "info"
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"


class QKanErrorHandler:
    """Zentrale Fehlerbehandlung für QKan.

    Nimmt QKAN-spezifische Fehler entgegen, klassifiziert sie und:
      - Loggt sie auf passender Ebene
      - Zeigt sie in QGIS an (Message Bar / Dialog)
      - Wirft sie optional neu oder gibt sie zurück

    Verwendung in Dialog/Action-Grenzen:
      try:
          result = some_operation()
      except QkanError as e:
          global_error.handle(e, context="Datenbank-Upload")
          # oder direkt ohne Exception:
      except Exception as e:
          global_error.handle(e, context="Datenbank-Upload")
    """

    def __init__(self, logger_name: str = "QKan.error"):
        self.logger = get_logger(logger_name)

    def handle(
        self,
        error: Exception,
        *,
        context: str = "Fehler",
        parent=None,
        reraise: bool = True,
        show_dialog: bool = True,
    ) -> QkanError:
        """Zentrale Fehlerbehandlung.

        Args:
            error: Exception (ideal: QkanError oder Subklasse)
            context: Kontextbeschreibung für Log (z.B. "Datenbank-Upload")
            parent: QGIS Parent-Widget für Dialog
            reraise: Fehler nach Behandlung neu werfen?
            show_dialog: Fehler in Dialog anzeigen?

        Returns:
            QkanError (zum Weiterleiten, wenn reraise=False)
        """
        level, user_friendly_msg, tech_msg = self._classify_error(error, context)

        # Logging auf richtiger Ebene
        self._log_error(level, tech_msg, error)

        # QGIS-Anzeige
        if show_dialog:
            self._show_in_qgis(user_friendly_msg, level, parent, context)

        # Fehler für Weiterleitung vorbereiten
        qkan_error = self._to_qkan_error(error)

        if reraise:
            raise qkan_error
        return qkan_error

    def report(
        self,
        message: str,
        *,
        exception: Optional[Exception] = None,
        context: str = "Fehler",
        title: str = "QKan Fehler",
        parent=None,
        reraise: bool = True,
        is_user_error: bool = False,
    ) -> QkanError:
        """Einfache Variante: direkt eine Nachricht (alt-kompatibel).

        Diese Methode ist für schrittweise Migration gedacht.
        """
        if exception is not None:
            # Exception vorhanden → über die komplexere handle() laufen
            return self.handle(
                exception,
                context=context,
                parent=parent,
                reraise=reraise,
                show_dialog=True,
            )

        # Nur Nachricht
        error = QkanUserError(message) if is_user_error else QkanError(message)
        level = ErrorLevel.WARNING if is_user_error else ErrorLevel.ERROR

        if exception is not None:
            self._log_error(level, message, exception)
        elif is_user_error:
            self.logger.warning_user(message)
        else:
            self.logger.error_code(message)

        if parent:
            self._show_in_qgis(message, level, parent, title)

        if reraise:
            raise error
        return error

    def _classify_error(
        self, error: Exception, context: str
    ) -> tuple[ErrorLevel, str, str]:
        """Fehler klassifizieren und passende Meldungen generieren."""

        if isinstance(error, QkanUserError):
            # Benutzerfehler: keine Stacktrace, kurze Meldung
            return (
                ErrorLevel.WARNING,
                str(error),
                f"{context}: {error}",
            )

        elif isinstance(error, QkanDbError):
            # Datenbankfehler: technisch ins Log, verständlich für UI
            return (
                ErrorLevel.ERROR,
                f"Datenbankfehler: {str(error)[:100]}...",
                f"{context} (DB): {error}",
            )

        elif isinstance(error, QkanAbortError):
            # Kontrollierter Abbruch: nur Info
            return (
                ErrorLevel.INFO,
                "Operation wurde abgebrochen.",
                f"{context}: Abbruch",
            )

        elif isinstance(error, QkanError):
            # Sonstiges QKAN-Fehler: allgemein
            return (
                ErrorLevel.ERROR,
                f"QKan-Fehler: {str(error)[:100]}",
                f"{context}: {error}",
            )

        else:
            # Unerwarteter Fehler
            return (
                ErrorLevel.CRITICAL,
                "Ein unerwarteter Fehler ist aufgetreten. Details finden Sie im Log.",
                f"{context} (BUG?): {type(error).__name__}: {error}",
            )

    def _log_error(self, level: ErrorLevel, message: str, error: Exception) -> None:
        """Fehler auf passender Log-Ebene festhalten."""
        if level == ErrorLevel.INFO:
            self.logger.info(message)
        elif level == ErrorLevel.WARNING:
            self.logger.warning_user(message)
        elif level == ErrorLevel.ERROR:
            self.logger.error_code(message, exc_info=error if isinstance(error, QkanError) else None)
        elif level == ErrorLevel.CRITICAL:
            self.logger.error(message, exc_info=True)

    def _show_in_qgis(
        self,
        message: str,
        level: ErrorLevel,
        parent=None,
        title: str = "QKan",
    ) -> None:
        """Fehler in QGIS anzeigen (Message Bar + Dialog bei kritisch)."""
        try:
            from qgis.PyQt.QtWidgets import QMessageBox
            from qgis.gui import QgisInterface
        except Exception:
            return

        # Message Bar (falls iface vorhanden)
        try:
            from qgis.core import QgsApplication

            iface = QgsApplication.instance()
            if hasattr(iface, "messageBar") and callable(iface.messageBar):
                icon_level = {
                    ErrorLevel.INFO: 0,  # Info
                    ErrorLevel.WARNING: 1,  # Warning
                    ErrorLevel.ERROR: 2,  # Critical
                    ErrorLevel.CRITICAL: 2,  # Critical
                }.get(level, 2)
                iface.messageBar().pushMessage(title, message, level=icon_level, duration=10)
        except Exception:
            pass

        # Dialog bei kritischen Fehlern
        if level == ErrorLevel.CRITICAL:
            QMessageBox.critical(parent, title, message)
        elif level == ErrorLevel.WARNING:
            QMessageBox.warning(parent, title, message)

    def _to_qkan_error(self, error: Exception) -> QkanError:
        """Fehler in QkanError umwandeln, falls noch nicht."""
        if isinstance(error, QkanError):
            return error
        # Fallback: als allgemeinen QkanError wrappen
        return QkanError(str(error))


# Globale Instanz für zentrale Fehlerbehandlung
global_error = QKanErrorHandler()
