1 临时目录 tmp里打日志和安装的中间文件
2 支持wm cscope tags taglist 

针对mac安装cscope的问题：
#1 下载cscope最新版本

     http://cscope.sourceforge.net/#downloads

#2 解压缩     

      tar xvf cscope-15.8b.tar

#3 修订cscope的源文件

     vim src/constants.h

     在111行后添加

      //#undef TERMINFO

       #define TERMINFO 1 

#4  安装

     ./configure && make all && sudo make install

     如果安装遇到如下错误，那就是没有进行步骤3

/usr/include/ncurses.h:539:40: error: macro "cbreak" passed 1 arguments, but takes just 0

/usr/include/ncurses.h:564:44: error: macro "erasechar" passed 1 arguments, but takes just 0

/usr/include/ncurses.h:600:43: error: macro "killchar" passed 1 arguments, but takes just 0

#5 修改PATH

     vim ~/.bashrc

     添加:PATH="/usr/local/bin:$PATH"

     如果想要立即生效，在终端下输入“ export PATH="/usr/local/bin:$PATH" ”


