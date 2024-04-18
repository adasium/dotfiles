#!/usr/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))
ln -sfv $SCRIPT_DIR/chom_dt.py ~/.local/bin/chom_dt
ln -sfv $SCRIPT_DIR/chom_diff.py ~/.local/bin/chom_diff
ln -sfv $SCRIPT_DIR/chom_csv2json.py ~/.local/bin/chom_csv2json
ln -sfv $SCRIPT_DIR/chom_json2csv.py ~/.local/bin/chom_json2csv
ln -sfv $SCRIPT_DIR/chom_frompythonjson.py ~/.local/bin/chom_frompythonjson
