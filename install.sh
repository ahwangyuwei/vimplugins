#!/bin/sh
echo "Make sure you have sudo priority, then see tmp/install.log ..."
{
set -x
mkdir -p tmp
exec &>tmp/install.log &&
dir=$(pwd)

tar -zxf ${dir}/packages/cscope-15.8a.tar.gz -C ${dir}/tmp/  &&
tar -zxf ${dir}/packages/ctags-5.8.tar.gz -C ${dir}/tmp/ &&
cd ${dir}/tmp/ctags-5.8 && ./configure && make clean && make && sudo make install &&
pwd
cd ${dir}/tmp/cscope-15.8a && ./configure && make clean && make && sudo make install &&
pwd

cd ../../
pwd
touch ~/.vimrc && cat sources/vimrc  >~/.vimrc    &&
mkdir -p ~/.vim && cp -rf sources/vim/* ~/.vim
} &

tail -f tmp/install.log
##123##
