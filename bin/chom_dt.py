#!/usr/bin/env python
from __future__ import annotations

import sys
import argparse

from datetime import datetime
from datetime import timedelta
from datetime import timezone
from typing import Sequence


LOGZIO_FORMAT = '%b %d, %Y @ %H:%M:%S.%f'
GCF_FORMAT = '%Y-%m-%dT%H:%M:%S'


def _columns(string: str) -> list[str] | None:
    chunks = string.split(',')
    return [chunk.strip() for chunk in chunks]


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('-gcf', '--google-cloud-functions', required=False, action='store_true')
    args = parser.parse_args()

    timestamp_str = sys.stdin.read().strip()

    local_timestamp = datetime.strptime(timestamp_str, LOGZIO_FORMAT)
    utc_timestamp = local_timestamp.astimezone(timezone.utc)

    if args.google_cloud_functions:
        timestamp_before = utc_timestamp - timedelta(minutes=1)
        timestamp_after = utc_timestamp + timedelta(minutes=1)
        print(f'timestamp >= "{timestamp_before:{GCF_FORMAT}}" AND timestamp <= "{timestamp_after:{GCF_FORMAT}}"')
        return 0

    print(utc_timestamp)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
