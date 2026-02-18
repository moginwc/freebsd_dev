#!/bin/tcsh

# シェルスクリプト初期設定
set ver="freebsd142_3"

# システム起動時に ntpdが起動するよう設定する (3.初期設定 ntpd)
sudo service ntpd enable
sudo cp ./etc_ntp.conf /etc/ntp.conf

# 省エネ動作の設定を行う (3.初期設定 powerd)
sudo service powerd enable

# グラフィックドライバーのインストール (3.初期設定 グラフィックドライバー)
sudo pkg install -y -q drm-510-kmod
sudo sysrc kld_list+=i915kms
sudo pw groupmod video -m pcuser

# ファイヤーウォールの設定 (3.初期設定 ファイヤーウォール)
sudo service pf enable
sudo sysrc pf_rules+=/etc/pf.conf
sudo cp etc_pf.conf /etc/pf.conf

# vimエディターをインストールする (3.初期設定 vimエディタ)
sudo pkg install -y -q vim
cp ./.vimrc ~

# シェルスクリプト初期設定 (3.初期設定 シェルスクリプト)
cp ./.cshrc ~
cp ./.login ~

# X-Window System をインストールする (3.初期設定 ウインドウ関係1)
sudo pkg install -y -q xorg

# ウィンドウシステムをインストールする
sudo pkg install -y -q fvwm
mkdir ~/icons
cp /usr/local/share/fvwm/pixmaps/programs.xpm ~/icons
cp /usr/local/share/fvwm/pixmaps/xterm-sol.xpm ~/icons
sudo pkg install -y -q ImageMagick7
magick ~/icons/programs.xpm -trim +repage -scale 200% ~/icons/programs.png
magick ~/icons/xterm-sol.xpm -crop 44x34+5+2 ~/icons/xterm-sol.png
sudo pkg install -y -q fvwm3
sudo pkg install -y -q ja-font-ipa

# ウィンドウシステムの初期設定 (3.初期設定 ウインドウ関係2,3)
cp ./.xinitrc ~
cp ./.fvwm2rc ~

# 端末エミュレータのインストールと設定 (3.初期設定 端末エミュレータ)
sudo pkg install -y -q mlterm
cp -r ./.mlterm ~

# 入力メソッド・日本語入力システムのインストールと設定 (3.初期設定 日本語入力1,2)
sudo pkg install -y -q ja-uim-anthy uim-gtk uim-gtk3 uim-qt5
cp -r ./.xkb ~

# 入力メソッド・日本語入力システムの初期設定 (3.初期設定 日本語入力3相当)
cp -r ./.uim.d-anthy ~
mv ~/.uim.d-anthy ~/.uim.d

# ユーザー辞書ファイルの作成
mkdir ~/.anthy
touch ~/.anthy/private_words_default

# アプリのインストール (3.初期設定 Firefox、その他)
sudo pkg install -y -q firefox-esr
sudo pkg install -y -q scrot
sudo pkg install -y -q xlockmore
sudo pkg install -y -q lupe
sudo pkg install -y -q xpad3

# おわり
exit

