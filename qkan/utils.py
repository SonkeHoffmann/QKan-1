import datetime
import logging
import tempfile
from logging import StreamHandler, LogRecord
from pathlib import Path
from typing import Any, cast

from qgis.core import QgsMessageLog, Qgis

LOG_NOTICE = logging.INFO + 1
LOG_ERROR_CODE = logging.ERROR + 1
LOG_ERROR_DATA = logging.ERROR + 2
LOG_ERROR_USER = logging.ERROR + 3


class QkanError(Exception):
    """General QKan error type"""


class QkanAbortError(QkanError):
    """Raised when an error in a task occurs"""


class QkanDbError(QkanError):
    """Raised when a database error occurs"""


def _translate_level(level: int) -> int:
    """Translate logging level to Qgis logging level."""
    return {
        logging.CRITICAL: Qgis.Critical,
        logging.ERROR: Qgis.Critical,
        logging.WARNING: Qgis.Warning,
        logging.INFO: Qgis.Info,
        logging.DEBUG: Qgis.Info,
        logging.NOTSET: Qgis.NoLevel,
        # custom levels
        LOG_NOTICE: Qgis.Info,
        LOG_ERROR_CODE: Qgis.Critical,
        LOG_ERROR_DATA: Qgis.Critical,
        LOG_ERROR_USER: Qgis.Critical,
    }.get(level, Qgis.NoLevel)


class QgisPanelLogger(StreamHandler):
    def __init__(self, iface):
        super().__init__()
        self.iface = iface

    def emit(self, record: LogRecord) -> None:
        msg = self.format(record)

        # noinspection PyArgumentList
        QgsMessageLog.logMessage(
            tag="QKan",
            message=msg,
            # notify user on notice or about warnings and above
            notifyUser=(
                record.levelno == LOG_NOTICE or record.levelno >= logging.WARNING
            ),
            level=_translate_level(record.levelno),
        )

        if record.levelno >= logging.WARNING:
            self.iface.openMessageLog()


class QKanLogger(logging.Logger):
    # todo: remove exceptions, raise explicitly instead
    def notice(self, msg: str, *args: Any, **kwargs: Any):
        self._log(LOG_NOTICE, msg, args, **kwargs)

    def error_user(self, msg: str, *args, **kwargs):
        kwargs.setdefault("exc_info", True)
        self._log(LOG_ERROR_USER, msg, args, **kwargs)
        raise BaseException

    def error_data(self, msg: str, *args, **kwargs):
        kwargs.setdefault("exc_info", True)
        self._log(LOG_ERROR_DATA, msg, args, **kwargs)
        raise BaseException

    def error_code(self, msg: str, *args, **kwargs):
        kwargs.setdefault("exc_info", True)
        self._log(LOG_ERROR_CODE, msg, args, **kwargs)
        raise BaseException


class QKanLoggingManager(logging.Manager):
    def __init__(self, rootnode: QKanLogger):
        super().__init__(cast(logging.RootLogger, rootnode))
        self.setLoggerClass(QKanLogger)


def setup_logging(log_to_console: bool, iface) -> tuple[QKanLogger, Path]:
    """Set up our custom logger & logging manager"""

    # remove handlers if a prior instance of our logger exists
    logging_instance = logging.getLogger("QKan")
    if type(logging_instance).__name__ == QKanLogger.__name__:
        logging_instance.handlers.clear()

    # create custom logger
    logger = QKanLogger("Qkan")
    logger.setLevel(logging.DEBUG)

    # inject custom manager as default
    QKanLogger.manager = QKanLoggingManager(logger)

    # register custom logging levels
    for level, name in [
        (LOG_NOTICE, "NOTICE"),
        (LOG_ERROR_CODE, "ERROR_CODE"),
        (LOG_ERROR_DATA, "ERROR_DATA"),
        (LOG_ERROR_USER, "ERROR_USER"),
    ]:
        logging.addLevelName(level, name)

    formatter = logging.Formatter(
        fmt="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )
    log_path = Path(tempfile.gettempdir()) / "QKan_{}.log".format(
        datetime.datetime.today().strftime("%Y-%m-%d")
    )
    file_handler = logging.FileHandler(log_path)
    file_handler.setFormatter(formatter)
    file_handler.setLevel(logging.DEBUG)

    # todo: dynamically decide where to log to, configurable in settings
    qgis_handler = QgisPanelLogger(iface)
    qgis_handler.setFormatter(logging.Formatter(fmt="%(name)s - %(message)s"))
    qgis_handler.setLevel(logging.INFO)

    logger.addHandler(file_handler)
    logger.addHandler(qgis_handler)

    if log_to_console:
        stream_handler = logging.StreamHandler()
        stream_handler.setFormatter(formatter)
        stream_handler.setLevel(logging.DEBUG)
        logger.addHandler(stream_handler)

    # inject our logger into global logger registry
    acquire_lock = getattr(logging, "_acquireLock")
    if acquire_lock is not None and callable(acquire_lock):
        acquire_lock()
    else:
        logger.error_code("logging is missing _acquireLock()")

    logging.Logger.manager.loggerDict["QKan"] = logger
    release_lock = getattr(logging, "_releaseLock")
    if release_lock is not None and callable(release_lock):
        release_lock()
    else:
        logger.error_code("logging is missing _releaseLock()")

    return logger, log_path


def get_logger(name: str) -> QKanLogger:
    """Return custom QKanLogger instance."""

    return QKanLogger("Qkan").getChild(name.replace("QKan.", ""))
