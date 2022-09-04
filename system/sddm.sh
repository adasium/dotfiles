#!/bin/bash

THEME_NAME=monochrome
THEME_DIRNAME=$THEME_NAME-kde
git clone https://gitlab.com/pwyde/monochrome-kde/ /tmp/$THEME_DIRNAME
pushd /tmp/$THEME_DIRNAME
git reset --hard d132699a26e126203bfda55da5e4bdf7acb035db
popd
sudo cp -rf /tmp/$THEME_DIRNAME/sddm/themes/$THEME_NAME /usr/share/sddm/themes/$THEME_DIRNAME
sddm-greeter --theme /usr/share/sddm/themes/$THEME_DIRNAME
sudo sed -i "s/Current=.*/Current=$THEME_DIRNAME/" /usr/lib/sddm/sddm.conf.d/default.conf
