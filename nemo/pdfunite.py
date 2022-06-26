#!/usr/bin/env python

import logging
import os
import subprocess
from datetime import datetime
from typing import Optional
from typing import Sequence

logging.basicConfig(
    filename='/tmp/pdfunite.log',
    filemode='a',
    format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
    datefmt='%H:%M:%S',
    level=logging.DEBUG,
)
logger = logging.getLogger('pdfunite.py')


def main(argv: Optional[Sequence[str]] = None) -> int:
    nemo_script_selected_file_paths = os.environ['NEMO_SCRIPT_SELECTED_FILE_PATHS']
    files_to_merge = nemo_script_selected_file_paths.strip().split('\n')
    out_file = datetime.now().strftime('%Y_%m_%d__%H_%M_%S.pdf')

    _d_log_files = "\n\t".join(f'"{file}"' for file in files_to_merge)
    logger.debug(f'Merging files:\n\t{_d_log_files}\n into {out_file}')

    try:
        cmd_target_files = ' '.join(f'"{file}"' for file in files_to_merge)
        result, err = subprocess.check_output(
            f'/usr/bin/pdfunite {cmd_target_files} {out_file}',
            stderr=subprocess.STDOUT,
            shell=True,
        )
    except Exception as e:
        logger.exception(e)

    logger.debug(f'Result: {err}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
