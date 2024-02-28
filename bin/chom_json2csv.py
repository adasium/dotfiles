#!/usr/bin/env python
from __future__ import annotations

import csv
import json
import sys
import argparse

from datetime import datetime
from enum import Enum
from typing import NamedTuple
from typing import Optional
from typing import Sequence


DELIM = ','


def _columns(string: str) -> list[str] | None:
    chunks = string.split(',')
    return [chunk.strip() for chunk in chunks]


class FormatInfo(NamedTuple):
    column: str
    type: str
    rest: str


def _format(string: str) -> dict[str, FormatInfo] | None:
    if not string.strip():
        return None
    chunks = string.split(',')
    def _inner():
        for chunk in chunks:
            column, type, rest = chunk.split(':')
            yield FormatInfo(
                column=column,
                type=type,
                rest=rest,
            )
    return {
        f.column: f for f in _inner()
    }


def try_parse_datetime(dt_str: str) -> datetime:
    formats = [
        "%Y-%m-%d %H:%M:%S.%f %Z",
        "%m/%d/%Y",
    ]
    for format in formats:
        try:
            return datetime.strptime(dt_str, format)
        except ValueError:
            pass
    raise ValueError(f"Error: Unable to parse datetime string. tried: {formats}")



def format_output_item(
    key: str,
    value: object | None,
    format_config: dict[str, FormatInfo] | None,
) -> str:
    if value is None:
        return 'null'
    if format_config is None:
        return str(value)
    format_info = format_config.get(key)
    if format_info is None:
        return str(value)
    if format_info.type == 'dt':
        dt = try_parse_datetime(value)
        return dt.strftime(format_info.rest)
    return str(value)


class Direction(Enum):
    ASC = 'ASCENDING'
    DESC = 'DESCENDING'

    @classmethod
    def from_str(cls, value: str) -> Direction:
        if value.lower().startswith('asc'):
            return cls.ASC
        else:
            return cls.DESC


class SortBy(NamedTuple):
    column: str
    direction: Direction = Direction.ASC


def _sort(sort_str: str) -> list[SortBy]:
    if not sort_str.strip():
        return []
    chunks = sort_str.split(DELIM)
    def _inner():
        for chunk in chunks:
            column, *direction = chunk.split(':')
            direction = direction and direction[0].upper() or 'ASCENDING'
            yield SortBy(
                column=column,
                direction=Direction.from_str(direction),
            )
    try:
        list(_inner())
    except Exception as e:
        print(e)
    return list(_inner())


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--debug', required=False, action='store_true')
    parser.add_argument('-c', '--columns', required=False, type=_columns)
    parser.add_argument('-f', '--format', required=False, type=_format)
    parser.add_argument('-s', '--sort', required=False, type=_sort)

    args = parser.parse_args()
    if args.debug:
        print(args.columns)
    data = json.load(sys.stdin)
    json_fields = set()
    for doc in data:
        json_fields |= set(doc)

    csv_columns = args.columns or json_fields
    print(','.join(csv_columns))

    for sort_by in reversed(args.sort or []):
        data = sorted(
            data,
            key=lambda x: x[sort_by.column] or '',
            reverse=sort_by.direction == Direction.DESC,
        )

    for doc in data:
        line = ','.join(
            format_output_item(
                key=col,
                value=doc[col],
                format_config=args.format,
            )
            for col in csv_columns
        )
        print(line)


    return 0


if __name__ == '__main__':
    raise SystemExit(main())
