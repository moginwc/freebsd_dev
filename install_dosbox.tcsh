#!/bin/tcsh

# DOSBox-XとLHAのインストール
sudo pkg install -y dosbox-x lha

# DOSBox-X用ディレクトリの作成
mkdir ~/dos
mkdir ~/dos/UTIL
mkdir ~/dos/OLS

# LHAのダウンロードと展開
fetch https://ftp.vector.co.jp/00/24/521/lha255.exe
lha xw=${home}/dos/UTIL lha255.exe
mv lha255.exe ${home}/dos/OLS/LHA255.EXE

# FILMTN(DOS/V版)のダウンロードと展開
fetch https://ftp.vector.co.jp/01/03/557/fmv245.lzh
lha xw=${home}/dos/UTIL fmv245.lzh
mv fmv245.lzh ${home}/dos/OLS/FMV245.LZH

# LHMTN(DOS/V版)のダウンロードと展開
fetch https://ftp.vector.co.jp/01/03/557/lmv213.lzh
lha xw=${home}/dos/UTIL lmv213.lzh
mv lmv213.lzh ${home}/dos/OLS/LMV213.LZH

# ファイル名の大文字化
find ~/dos/UTIL/ -type f -exec tcsh -c 'set f="{}"; set bn=`basename "$f"`; set dn=`dirname "$f"`; mv "$f" "$dn/`echo $bn | tr a-z A-Z`"' \;

exit
