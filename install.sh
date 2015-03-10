#!/bin/sh
echo "Make sure you have sudo priority, then see tmp/install.log ..."

set -x
exec &>tmp/install.log

tar -zxf packages/cscope-15.8a.tar.gz -C tmp/
tar -zxf packages/ctags-5.8.tar.gz -C tmp/
cd tmp/ctags-5.8 && ./configure && make clean && make && sudo make install
cd tmp/cscope-15.8a && ./configure && make clean && make && sudo make install

cd ../../
touch ~/.vimrc && cat sources/vimrc  >~/.vimrc
mkdir -p ~/.vim && cp -rf sources/vim/* ~/.vim

