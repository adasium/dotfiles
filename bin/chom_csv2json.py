#!/usr/bin/env python
from __future__ import annotations

import csv
import json
import sys
import argparse

from typing import Optional
from typing import Sequence


def _columns(string: str) -> list[str] | None:
    chunks = string.split(',')
    return [chunk.strip() for chunk in chunks]


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', '--columns', required=False, type=_columns)
    parser.add_argument('-k', '--keys', required=False, action='store_true')
    parser.add_argument('-d', '--debug', required=False, action='store_true')
    args = parser.parse_args()
    if args.debug:
        print(args.columns)

    reader = csv.DictReader(sys.stdin)
    if args.keys:
        print(reader.fieldnames)
        return 0

    csv_columns = reader.fieldnames
    if args.columns:
        assert args.columns, repr(args.columns)
        assert set(args.columns).intersection(reader.fieldnames)
        csv_columns = args.columns

    for d in reader:
        l = {
            column: d[column]
            for column in csv_columns
        }
        print(json.dumps(l))

    return 0


if __name__ == '__main__':
    raise SystemExit(main())
