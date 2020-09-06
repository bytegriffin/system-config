#!/bin/bash

echo "Linuxmint 20 Cinnamon 配置脚本 v2020.9.5"
echo "--------------------------------------------------"

echo "请选择速度最快的那个软件源"
sudo software-properties-gtk

echo "正在更新软件包列表，请稍候..."
sudo apt update && sudo apt upgrade -y

echo "正在清理冗余软件包"
sudo apt remove --purge firefox onboard gnome-mines transmission-gtk transmission-common xterm unity-webapps-common hexchat rhythmbox -y

echo "正在安装fcitx输入法"
sudo apt-get install fcitx-bin fcitx-table fcitx-pinyin  fcitx-config-common fcitx-config-gtk fcitx-libs -y

echo "正在下载搜狗输入法安装包"
wget http://cdn2.ime.sogou.com/dl/index/1599192613/sogoupinyin_2.3.2.07_amd64-831.deb
sudo dpkg -i sogoupinyin_*.deb && rm sogoupinyin_*.deb

echo "正在安装Vim和Ntfs-config vim-youcompeteme"
sudo apt install vim vim-nox vim-youcompleteme -y

echo "正在更新gedit"
sudo apt install gedit -y
gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['GB18030', 'UTF-8', 'CURRENT', 'ISO-8859-15','UTF-16']"

echo "正在安装git"
sudo apt install git -y
git config --global user.name "bytegriffin"
git config --global user.email "bytegriffin@126.com"
git config --global core.editor vim

echo "将apt-get更换为apt-fast"
git clone https://github.com/ilikenwf/apt-fast.git
cd apt-fast
sudo ./quick-install.sh

echo "正在安装 oh-my-zsh"
sudo apt-get install zsh -y
#面的命令如果报“拒绝连接”的错误，可以试着去https://site.ip138.com/ ，输入raw.githubusercontent.com 进行查询,
#然后执行 sudo vi /etc/hosts  把151.101.108.133 raw.githubusercontent.com添加进去
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo vi ~/.zshrc
#将ZSH_THEME="ys" plugins 加入 zsh-autosuggestions
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zshrc


echo "同步win10和ubuntu的系统时间"
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true
sudo apt-get install ntpdate
sudo ntpdate time.windows.com

echo "安装kolour画图"
sudo apt-get install kolourpaint4 -y 

echo "正在安装常用软件"
sudo apt-get install lnav wget ctags curl vsftpd gnupg2 tmux meld htop putty subversion nload iptraf iftop tree apt-transport-https ca-certificates software-properties-common gnupg2 tcl -y

echo "正在安装exfat,ntfs"
sudo apt-get install exfat-fuse exfat-utils ntfs-3g -y

echo "正在安装gconf-editor,dconf-editor"
sudo apt install gconf-editor dconf-editor -y

echo "正在安装alien openssh-client ntfs-config"
sudo apt install alien openssh-client openssh-server -y

echo "正在安装新立得软件包管理器"
sudo apt install synaptic -y

echo "正在安装BleachBit系统清理工具"
sudo apt install bleachbit -y

echo "正在安装gdebi软件包安装程序"
sudo apt install gdebi -y

echo "正在下载Google Chrome安装包"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install libappindicator1 -y
sudo dpkg -i google-chrome*.deb && rm google-chrome*.deb

echo "正在安装Adobe Flash Player"
sudo apt install pepperflashplugin-nonfree

echo "正在安装mint codecs"
sudo apt install mint-meta-codecs -y

echo "安装解码器"
sudo apt-get install ubuntu-restricted-extras -y

echo "正在安装VLC视频播放器"
sudo apt-get install vlc -y

echo "正在播放器SMPlayer"
sudo apt-get install smplayer smplayer-themes -y

echo "安装FFmpeg"
sudo apt-get install ffmpeg -y

echo "正在下载网易云音乐安装包"
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
sudo apt install libcanberra-gtk-module -y
sudo dpkg -i netease-cloud-music_*.deb && rm netease-*.deb

echo "正在安装 tweak-tool"
sudo apt-get install unity-tweak-tool gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell gnome-session gtk2-engines-pixbuf libxml2-utils -y

echo "正在安装压缩软件"
sudo apt install unrar guake p7zip-full  p7zip-rar  rar unzip -y

echo "正在安装kvm,android开发环境"
sudo apt-get install qemu-kvm bridge-utils -y

echo "正在安装Xtreme Download Managert下载工具"
wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz
tar -xvf xdm-*.tar.xz
sudo ./install.sh && rm -rf xdm-*.tar.xz install.sh readme.txt

echo "正在安装Motrix下载工具"
wget https://github.com/agalwood/Motrix/releases/download/v1.5.15/Motrix_1.5.15_amd64.deb
sudo dpkg -i Motrix*.deb && rm -rf Motrix*

echo "正在安装kazam录屏软件"
sudo apt install kazam -y

echo "正在安装文泉驿字体套件"
sudo apt install fonts-wqy-microhei -y

echo "正在安装MS TrueType字体"
sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v

echo "正在安装font manager字体管理工具"
sudo apt install font-manager fonts-powerline -y

echo "正在安装SpaceVim"
curl -sLf https://spacevim.org/cn/install.sh | bash

echo "正在安装wine"
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt update -y
sudo apt install --install-recommends winehq-stable

echo "正在安装gcc和g++"
sudo apt install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9 gcc-10 g++-10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo apt-get install cmake qtcreator -y

echo "正在安装jdk1.8"
wget https://github.com/bytegriffin/java/releases/download/jdk/jdk-8u261-linux-x64.tar.gz
sudo tar xzf jdk-*.tar.gz -C /opt/ide && rm -rf jdk-*.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/ide/jdk1.8.0_261/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /opt/ide/jdk1.8.0_261/bin/javac 300
sudo update-alternatives --config java
sudo update-alternatives --config javac

echo "正在安装flutter"
wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.20.3-stable.tar.xz
sudo tar xf flutter_*.tar.xz -C /opt/ide && rm -rf flutter_*.tar.xz

echo "正在安装golang"
wget https://dl.google.com/go/go1.15.1.linux-amd64.tar.gz
sudo tar xzf go*.tar.gz -C /opt/ide && rm -rf go*.tar.gz

echo "正在安装redis"
wget http://download.redis.io/releases/redis-6.0.7.tar.gz
sudo tar xzf redis*.tar.gz -C /opt/ide && rm -rf redis*.tar.gz

echo "正在安装python3 pip"
sudo apt-get install python python3 python3-pip -y
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
sudo apt-get install python3-setuptools

echo "正在安装Mysql8 注意:选择采用5.x的加密方式"
sudo apt-get install mysql-server  mysql-client -y

echo "正在安装DBBeaver"
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-*.deb
sudo apt update
sudo rm -rf dbeaver-*.deb

echo "正在安装Virtualbox"
wget https://download.virtualbox.org/virtualbox/6.1.14/virtualbox-6.1_6.1.14-140239~Ubuntu~eoan_amd64.deb
sudo dpkg -i virtualbox-*.deb
sudo apt update
sudo rm -rf virtualbox-*.deb

echo "正在安装docker"
sudo apt-get remove docker docker-engine docker.io
sudo apt install aufs-tools cgroupfs-mount pigz
sudo apt install docker.io -y

echo "正在设置daocloud.io，打开https://www.daocloud.io/mirror，可以看到具体地址"
sudo tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": ["http://f1361db2.m.daocloud.io"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "正在安装yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y
sudo apt-get install --no-install-recommends yarn

echo "正在安装nodejs"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs npm
sudo npm install -g nrm
nrm ls
nrm use taobao
sudo npm install -g webpack
sudo npm install -g gulp

echo "正在安装markdown"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

echo "正在安装scala"
wget https://downloads.lightbend.com/scala/2.13.3/scala-2.13.3.tgz
sudo tar xzf scala*.tgz -C /opt/ide && rm -rf scala*.tgz

echo "正在安装Etcd"
wget https://github.com/etcd-io/etcd/releases/download/v3.4.13/etcd-v3.4.13-linux-amd64.tar.gz
sudo tar xzf etcd*.tar.gz -C /opt/ide && rm etcd-*.tar.gz

echo "正在安装VSCode"
wget https://vscode.cdn.azure.cn/stable/a0479759d6e9ea56afa657e454193f72aef85bd0/code_1.48.2-1598353430_amd64.deb
sudo dpkg -i code*.deb && rm code*.deb

echo "正在安装Dukto"
sudo add-apt-repository ppa:rock-core/qt4
sudo apt update
sudo apt install libqtcore4 -y
wget http://ftp.lysator.liu.se/pub/opensuse/repositories/home:/colomboem/xUbuntu_16.04/amd64/dukto_6.0-1_amd64.deb
sudo dpkg -i dukto_*.deb && rm code*.deb

echo "正在安装Listen1"
wget https://github.com/listen1/listen1_desktop/releases/download/v2.12.3/listen1_2.12.3_linux_amd64.deb
sudo dpkg -i listen1*.deb && rm listen1*.deb

echo "正在安装Winws软件"
wget -O- https://deepin-wine.i-m.dev/setup.sh | sh
sudo apt-get install deepin.com.wechat
sudo apt-get install deepin.com.qq.im
sudo apt-get install deepin.com.baidu.pan
sudo apt-get install deepin.com.thunderspeed
sudo apt-get install deepin.cn.com.winrar

echo "正在清理安装过程中产生的冗余软件包"
sudo apt autoremove --purge -y
sudo apt autoclean
sudo apt clean