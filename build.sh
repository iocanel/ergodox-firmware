#!/bin/bash

TMP_DIR=$(mktemp -d)
pushd $TMP_DIR
git clone https://github.com/qmk/qmk_firmware.git
QMK_DIR=$TMP_DIR/qmk_firmware
mkdir -p $QMK_DIR/keyboards/ergodox_ez/keymaps/iocanel
popd
cp keymap.c $QMK_DIR/keyboards/ergodox_ez/keymaps/iocanel

docker run --rm -e keymap=iocanel -e keyboard=ergodox_ez -v $QMK_DIR:/qmk:rw edasque/qmk_firmware
#docker run --rm -v $QMK_DIR/keyboards/ergodox_ez/keymaps/iocanel:/keymap:rw lcourtois/ergodox-compiler
#docker run --rm -v $QMK_DIR/keyboards/ergodox_ez/keymaps/iocanel:/keymap:rw potz/ergodox-ez-compiler
