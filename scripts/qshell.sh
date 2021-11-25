#!/usr/bin/env bash

wget http://devtools.qiniu.com/qshell-linux-x64-v2.4.2.zip -O qshell.zip
unzip qshell.zip -d tmp
mv tmp/qsh* qshell
chmod +x qshell

wget https://github.com/gohugoio/hugo/releases/download/v0.89.4/hugo_0.89.4_Linux-64bit.tar.gz -O hugo.tar.gz
tar -xzvf hugo.tar.gz
chmod +x hugo
