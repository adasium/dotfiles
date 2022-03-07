#!/usr/bin/env python

import os
import sys
import subprocess
from argparse import ArgumentParser
from typing import Optional
from typing import Sequence


SAVE_DIR_PATH = '/tmp'


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = ArgumentParser()
    parser.add_argument('file', type=str, nargs='?')
    parser.add_argument('line', type=int, default=0, nargs='?')
    parser.add_argument('-e', '--editor', required=False)
    parser.add_argument_group
    args = parser.parse_args()

    if not sys.stdin.isatty() and args.file:
        filename = args.file
        with open(os.path.join(SAVE_DIR_PATH, filename), 'w') as f:
            f.write(sys.stdin.read())
        return 0

    if not args.file:
        print('`file` argument must not be empty', file=sys.stderr)

    with open(os.path.join(SAVE_DIR_PATH, args.file)) as f:
        found = False
        for i, line in enumerate(f):
            if i == args.line:
                found = True
                print(line, end='')
                if args.editor:
                    subprocess.Popen([args.editor, line.strip()])
                return 0
        if not found:
            print(f'IndexError: {args.line} > {i}', file=sys.stderr)
            return 1

    return 0


if __name__ == '__main__':
    raise SystemExit(main())
