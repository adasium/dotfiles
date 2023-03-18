#!/usr/bin/env python3
# https://github.com/xournalpp/xournalpp/issues/3189#issuecomment-1026883495

import gzip
from pathlib import Path
import xml.etree.ElementTree as ET


xopp_files = [fname for fname in Path().iterdir() if fname.is_file() and fname.suffix == ".xopp"]

print(f"Attaching the pdf background for {len(xopp_files)} .xopp file{'' if len(xopp_files) == 1 else 's'}.")
for fname in xopp_files:
    fbackup = Path(f"{fname}.bak")
    fname.rename(fbackup)
    with gzip.open(fbackup, "r") as f:
        root = ET.fromstringlist([l.decode("utf-8") for l in f.readlines()])

    for bg in root.iter("background"):
        if "domain" in bg.attrib.keys() and "filename" in bg.attrib.keys():
            bg.attrib["domain"] = "absolute"
            # configure path where pdf can be found <-- HERE
            bg.attrib["filename"] = fname.with_suffix(".pdf").name
            bg.set('updated', 'yes')

    with gzip.open(fname, "w") as f:
        f.writelines(ET.tostringlist(root))
    # uncomment next line if you do not need backups a.k.a. trust this script
    #fbackup.unlink()
print("Done.")
