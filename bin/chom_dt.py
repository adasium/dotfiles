#!/usr/bin/env python
from __future__ import annotations

import sys
import argparse
import pytz

from datetime import datetime
from datetime import timedelta
from datetime import timezone
from typing import Sequence


LOGZIO_FORMAT = '%b %d, %Y @ %H:%M:%S.%f'
GCF_FORMAT = '%Y-%m-%dT%H:%M:%S'


def try_parse_datetime(dt_str: str) -> datetime:
    formats = [
        LOGZIO_FORMAT,
        "%Y-%m-%d %H:%M:%S.%f %Z",
        "%m/%d/%Y",
        # Firestore
        "%B %Y at %H:%M:%S %Z%z",
    ]
    for format in formats:
        try:
            return datetime.strptime(dt_str, format)
        except ValueError:
            pass
    raise ValueError(f"Error: Unable to parse datetime string. tried: {formats}")


def _columns(string: str) -> list[str] | None:
    chunks = string.split(',')
    return [chunk.strip() for chunk in chunks]


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description='guess datetime from string and convert to another dt')
    parser.add_argument('-gcf', '--google-cloud-functions', required=False, action='store_true', help='print GCF filter using timestamp as UTC')
    parser.add_argument('-tz', '--timezone', required=False)
    parser.add_argument('-d', '--debug', required=False, action='store_true')
    args = parser.parse_args()

    timestamp_str = sys.stdin.read().strip()
    if args.debug:
        local_tz = datetime.now(timezone.utc).astimezone().tzinfo
        print(f'{timestamp_str} {local_tz}')
    local_timestamp = try_parse_datetime(timestamp_str)
    utc_timestamp = local_timestamp.astimezone(timezone.utc)

    if args.google_cloud_functions:
        timestamp_before = utc_timestamp - timedelta(minutes=1)
        timestamp_after = utc_timestamp + timedelta(minutes=1)
        print(f'timestamp >= "{timestamp_before:{GCF_FORMAT}}" AND timestamp <= "{timestamp_after:{GCF_FORMAT}}"')
        return 0
    if args.timezone:
        tz = pytz.timezone(args.timezone)
        local_timestamp.astimezone(tz)

    print(utc_timestamp)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
