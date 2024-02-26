#!/usr/bin/env python
from __future__ import annotations

import ast
import json
import sys

from typing import Optional
from typing import Sequence


def main(argv: Optional[Sequence[str]] = None) -> int:
    for line in sys.stdin:
        d = ast.literal_eval(line)
        d = ast.literal_eval(d)
        print(json.dumps(d))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
