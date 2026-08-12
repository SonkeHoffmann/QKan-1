from __future__ import annotations

import site
import sys
from pathlib import Path


def ensure_user_site_packages() -> None:
    candidates = []

    try:
        user_site = site.getusersitepackages()
    except Exception:
        user_site = None

    if isinstance(user_site, str):
        candidates.append(user_site)
    elif isinstance(user_site, (list, tuple)):
        candidates.extend(user_site)

    try:
        candidates.extend(site.getsitepackages())
    except Exception:
        pass

    for candidate in candidates:
        if not candidate:
            continue
        candidate_path = Path(candidate)
        if candidate_path.exists() and candidate not in sys.path:
            sys.path.insert(0, candidate)
