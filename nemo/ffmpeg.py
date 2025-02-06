#!/usr/bin/env python
from __future__ import annotations

import logging
import os
import subprocess
import tkinter
from enum import Enum
from tkinter import Tk
from tkinter import W
from tkinter import IntVar
from tkinter import ttk
from typing import Sequence


logging.basicConfig(
    filename='/tmp/ffmpeg.log',
    filemode='a',
    format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
    datefmt='%H:%M:%S',
    level=logging.DEBUG,
)
logger = logging.getLogger('ffmpeg.py')


def maybe_int(value: str) -> int | None:
    try:
        return int(value)
    except ValueError as e:
        os.system(f'notify-send "{value}"')
        logger.exception(str(value))
        logger.exception(e)
        return None


def log_exceptions(func):
    def inner(*args, **kwargs):
        try:
            func(*args, **kwargs)
        except Exception as e:
            logger.exception(e)
    return inner


class VideoRotation(Enum):
    NONE = -1
    CLOCKWISE = 1
    COUNTERCLOCKWISE = 2


class AudioChannels(Enum):
    NO_MODIFICATION = -1
    CLONE_LEFT = 1
    CLONE_RIGHT = 2


def get_filenames() -> list[str]:
    files = os.environ['NEMO_SCRIPT_SELECTED_FILE_PATHS'].strip().split('\n')
    if not files:
        os.system(f'notify-send "no files selected"')
    return files


def create_radio(root, options: dict[Enum, str]):
    variable = IntVar()
    for value, label in options.items():
        ttk.Radiobutton(root, text=label, variable=variable, value=value.value, command=lambda: print(variable.get())).grid()
    return variable


def dirname(filename: str) -> str:
    """
    Example:
    input: /path/to/some/file.txt
    output: /path/to/some/file
    """
    return os.path.splitext(filename)[0]


@log_exceptions
def compile_ffmpeg(
    var_video_rotation,
    var_audio,
    output_name: str,
    crop: dict | None = None,
    crf: int | None = 28,
):
    video_options = []
    options = []
    if var_video_rotation != VideoRotation.NONE:
        video_options.extend([f'transpose={var_video_rotation.value}'])
    if var_audio != AudioChannels.NO_MODIFICATION:
        opt = {
            AudioChannels.CLONE_LEFT: 'pan=stereo|FL=FL|FR=FL',
            AudioChannels.CLONE_RIGHT: 'pan=stereo|FL=FR|FR=FR',
        }[var_audio]
        options.extend(['-af', opt])

    if crop:
        video_options.append(
            'crop=in_w-{left}:in_h-{top}:{x}:{y}'.format(
                left=crop['left']+crop['right'],
                top=crop['top']+crop['bottom'],
                x=crop['left'],
                y=crop['top'],
            )
        )

    if video_options:
        options.extend(['-vf', ','.join(video_options)])

    cmd = [
        'ffmpeg',
        '-i', get_filenames()[0],
        '-crf', str(crf or 28),
        *options,
        output_name,
        '-y',
    ]
    cmd_str = ' '.join(cmd)
    os.system(f'notify-send "{cmd_str}"')
    logger.info(f'==> {cmd_str}')
    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
    )
    logger.exception(result.stderr)


def main(argv: Sequence[str] | None = None) -> int:
    root = Tk()
    frm = ttk.Frame(root, padding=10)
    frm.grid()
    ttk.Label(frm, text="Hello World!").grid(column=0, row=0)
    ttk.Button(frm, text="Quit", command=root.destroy).grid(column=1, row=0)

    var_video_rotation = create_radio(
        root,
        options={
            VideoRotation.NONE: '-',
            VideoRotation.CLOCKWISE: 'clockwise',
            VideoRotation.COUNTERCLOCKWISE: 'counterclockwise',
        },
    )
    var_video_rotation.set(VideoRotation.NONE.value)

    var_audio = create_radio(
        root,
        options={
            AudioChannels.NO_MODIFICATION: '-',
            AudioChannels.CLONE_LEFT: 'clone left',
            AudioChannels.CLONE_RIGHT: 'clone right',
        },
    )
    var_audio.set(AudioChannels.NO_MODIFICATION.value)

    separator = ttk.Separator(root, orient='horizontal')
    separator.grid()
    tkinter.Label(root, text='out filename').grid()
    out_filename = tkinter.Entry(root)
    out_filename.delete(0, tkinter.END)
    out_filename.insert(0, 'test.mp4')
    out_filename.grid()

    def _scale(from_: int = 0, to: int = 64, default: int = 0, step: int = 1):
        crf_var = IntVar()
        crf = tkinter.Scale(root, from_=from_, to=to, orient="horizontal", length=200, variable=crf_var, resolution=step)
        crf.bind
        crf.set(default)
        crf.grid()
        return crf

    MAX_CROP = 1000
    tkinter.Label(root, text='crop from top:').grid()
    crop_top = _scale(0, MAX_CROP, step=50)
    crop_top.grid()
    tkinter.Label(root, text='crop from left:').grid()
    crop_left = _scale(0, MAX_CROP, step=50)
    crop_left.grid()
    tkinter.Label(root, text='crop from right:').grid()
    crop_right = _scale(0, MAX_CROP, step=50)
    crop_right.grid()
    tkinter.Label(root, text='crop from bottom:').grid()
    crop_bottom = _scale(0, MAX_CROP, step=50)
    crop_bottom.grid()

    tkinter.Label(root, text='crf').grid()

    crf = _scale(from_=0, to=64, default=32)

    ttk.Button(text="Submit", command=lambda: compile_ffmpeg(
        VideoRotation(var_video_rotation.get()),
        AudioChannels(var_audio.get()),
        out_filename.get(),
        crop={
            'top': maybe_int(crop_top.get()) or 0,
            'left': maybe_int(crop_left.get()) or 0,
            'right': maybe_int(crop_right.get()) or 0,
            'bottom': maybe_int(crop_bottom.get()) or 0,
        },
        crf=maybe_int(crf.get()),
    )).grid()

    root.mainloop()
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
