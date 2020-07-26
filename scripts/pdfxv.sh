#!/bin/bash
wine start /unix /home/chom/.local/share/pdfxv/PDFXCview.exe "$(winepath -w "$@")"
