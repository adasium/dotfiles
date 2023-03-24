#!/usr/bin/env python

import logging
import os
import re
import subprocess
from datetime import datetime
from typing import List
from typing import Optional
from typing import Sequence

logging.basicConfig(
    filename='/tmp/mp4_reduce_size.log',
    filemode='a',
    format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
    datefmt='%H:%M:%S',
    level=logging.DEBUG,
)
logger = logging.getLogger('mp4_reduce_size.py')


def get_filenames() -> List[str]:
    files = os.environ['NEMO_SCRIPT_SELECTED_FILE_PATHS'].strip().split('\n')
    _log_files = "\n\t".join(f'"{file}"' for file in files)
    logger.debug(f'Selected files:\n\t{_log_files}')
    return files


def dirname(filename: str) -> str:
    """
    Example:
    input: /path/to/some/file.txt
    output: /path/to/some/file
    """
    return os.path.splitext(filename)[0]


def increment_version(match) -> str:
    version_number = int(match.group(1))
    return f'_v{version_number + 1}.mp4'



def main(argv: Optional[Sequence[str]] = None) -> int:
    version_pattern = r'_v(\d+).mp4'
    try:
        for filename in get_filenames():
            if re.search(version_pattern, filename):
                out_filename = re.sub(version_pattern, increment_version, filename)
            else:
                out_filename = f'{dirname(filename)}_v2.mp4'
            result = subprocess.check_output(
                # f'/usr/bin/ffmpeg -i {filename} -vcodec libx264 {out_filename}',
                f'ffmpeg -i {filename} -c:v libx264 -preset superfast -crf 20 -c:a aac -b:a 128k {out_filename}'
                if filename.endswith('mp4') else
                f'ffmpeg -i {filename} -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -n "{out_filename}"',

                stderr=subprocess.STDOUT,
                shell=True,
            )
    except Exception as e:
        logger.exception(e)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
