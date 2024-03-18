#!/usr/bin/env python
from __future__ import annotations

import itertools
import csv
import json
import sys
import argparse

from typing import Optional
from typing import Sequence


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('file1', metavar='FILE1', type=str, help='first input file')
    parser.add_argument('file2', metavar='FILE2', type=str, help='second input file')
    parser.add_argument('-s1', metavar='SEPARATOR1', type=str, help='separator')
    parser.add_argument('-s2', metavar='SEPARATOR2', type=str, help='separator')
    args = parser.parse_args()

    with open(args.file1) as f1, open(args.file2) as f2:
        for l1, l2 in itertools.zip_longest(f1, f2):
            l1 = l1 and l1.strip()
            l2 = l2 and l2.strip()
            print(l1, l2)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
