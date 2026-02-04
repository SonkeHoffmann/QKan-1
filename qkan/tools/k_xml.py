from qkan.utils import get_logger, QkanAbortError
import sys

logger = get_logger(f'QKan.{__file__}')

def _get_float(block, tag: str, default: float = None) -> [float, None]:
    """Liest einen Tag und meldet falschen Datentyp"""
    if tag == "":
        logger.error_code(f'Tag ist fehlerhaft in Block {block.tag}')
        raise QkanAbortError
    text = block.findtext(tag, default)
    if text is None:
        return None
    elif isinstance(text, float):
        return text
    elif text.strip() == "":
        logger.info(f'Feld <{tag}> ist leer')
    elif isinstance(text, str):
        try:
            return float(text)
        except ValueError:
            logger.warning("_m150porter._import.py._get_float: %s" % sys.exc_info()[1])
            logger.warning(f'Falscher Datentyp in Feld <{tag}>')
        except Exception:
            logger.error_data(f"_m150porter._import.py._get_float: {sys.exc_info()[1]}\n"
                              f"Fehler in Block {block.tag} Feld <{tag}>")
            raise QkanAbortError
    return default

def _get_int(block, tag: str, default: int = None) -> [int, None]:
    """Liest einen Tag und meldet falschen Datentyp"""
    if tag == "":
        logger.error_code(f'Tag ist fehlerhaft in Block {block.tag}')
        raise QkanAbortError
    text = block.findtext(tag, default)
    if text is None:
        return None
    elif isinstance(text, int):
        return text
    elif text.strip() == "":
        logger.info(f'Feld <{tag}> ist leer')
    elif isinstance(text, str):
        try:
            return int(text)
        except ValueError:
            logger.warning("_m150porter._import.py._get_int: %s" % sys.exc_info()[1])
            logger.warning(f'Falscher Datentyp in Feld <{tag}>')
        except Exception:
            logger.warning("_m150porter._import.py._get_int: {sys.exc_info()[1]}\n"
                              f"Fehler in Block {block.tag} Feld <{tag}>")
            raise QkanAbortError
    return default
