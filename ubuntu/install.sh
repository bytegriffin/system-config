#!/bin/bash

echo "Ubuntu 18.04 配置脚本 v2018.8.10"
echo "--------------------------------------------------"

echo "请选择速度最快的那个软件源"
sudo software-properties-gtk

echo "正在更新软件包列表，请稍候。。。"
sudo apt update && sudo apt upgrade -y

echo "正在清理冗余软件包"
sudo apt remove --purge firefox aisleriot gnome-mahjongg gnome-mines gnome-sudoku gnome-mines cheese transmission-gtk transmission-common deja-dup hexchat rhythmbox -y

echo "正在安装gdebi软件包安装程序"
sudo apt install gdebi -y

echo "将apt-get更换为apt-fast"
git clone https://github.com/ilikenwf/apt-fast.git
cd apt-fast
sudo ./quick-install.sh

echo "正在安装fcitx输入法"
sudo apt-get install fcitx-bin fcitx-table fcitx-pinyin fcitx-config-common fcitx-config-gtk -y 

echo "正在下载搜狗输入法安装包"
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb

echo "正在安装搜狗输入法"
sudo dpkg -i sogoupinyin_2.2.0.0108_amd64.deb
sudo rm sogoupinyin_2.2.0.0108_amd64.deb

echo "正在安装Vim和Ntfs-config vim-youcompeteme"
sudo apt install vim vim-nox vim-youcompleteme -y

echo "正在更新gedit"
sudo apt install gedit -y
gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['GB18030', 'UTF-8', 'CURRENT', 'ISO-8859-15','UTF-16']"

echo "正在安装git"
sudo apt install git -y
git config --global user.name "bytegriffin"
git config --global user.email "bytegriffin@126.com"

echo "正在安装 oh-my-zsh"
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
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

echo "安装监控CPU、网络的使用率"
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor  
sudo apt-get update  
sudo apt-get install indicator-sysmonitor -y
indicator-sysmonitor &

echo "正在安装kolour画图工具"
sudo apt-get install kolourpaint4 -y 

echo "正在安装常用软件"
sudo apt-get install wget exuberant-ctags curl vsftpd gnupg2 tmux meld htop putty subversion nload  iptraf iftop tree apt-transport-https ca-certificates software-properties-common gdebi -y

echo "正在安装exfat,ntfs-3g"
sudo apt-get install exfat-fuse exfat-utils ntfs-3g -y

echo "正在安装gconf-editor,dconf-editor"
sudo apt install gconf-editor dconf-editor dconf-tools -y

echo "正在安装alien openssh-client ntfs-config"
sudo apt install alien openssh-client ntfs-config -y

echo "正在安装新立得软件包管理器"
sudo apt install synaptic -y

echo "正在安装BleachBit系统清理工具"
sudo apt install bleachbit -y

echo "正在安装Xenlism主题"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2B80AC38
sudo add-apt-repository ppa:xenatt/xenlism
sudo apt update -y
sudo apt install xenlism-minimalism-theme xenlism-storm-icon-theme xenlism-wildfire-icon-theme xenlism-finewalls -y

echo "正在安装arc-theme主题和docky"
sudo apt install arc-theme docky -y

echo "正在下载Google Chrome安装包"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "正在替换浏览器为Google Chrome"
sudo apt install libappindicator1 -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo "正在安装 ttf-mscorefonts-installer"
sudo wget http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb
sudo apt-get purge ttf-mscorefonts-installer -y
sudo apt install ./ttf-mscorefonts-installer_3.6_all.deb

echo "正在安装文泉驿、MS TrueType字体"
sudo apt install fonts-wqy-microhei ttf-wqy-microhei -y

echo "正在安装MS TrueType字体"
sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v

echo "正在安装font manager字体管理工具"
sudo apt install font-manager fonts-powerline -y

echo "正在安装Adobe Flash Player"
sudo apt install pepperflashplugin-nonfree

echo "安装解码器"
sudo apt-get install ubuntu-restricted-extras -y

echo "安装VLC视频播放器"
sudo apt-get install vlc browser-plugin-vlc -y

echo "播放器SMPlayer"
sudo apt-get install smplayer smplayer-themes -y

echo "安装FFmpeg"
sudo apt-get install ffmpeg -y

echo "正在下载网易云音乐安装包"
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb

echo "正在安装网易云音乐"
sudo apt install libcanberra-gtk-module -y
sudo dpkg -i netease-cloud-music_1.1.0_amd64_ubuntu.deb
sudo rm netease-*.deb

echo "正在安装 tweak-tool"
sudo apt-get install unity-tweak-tool gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell gnome-session gtk2-engines-pixbuf libxml2-utils -y

echo "正在安装Shutter截屏软件"
sudo apt install shutter -y
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas-common_1.0.0-1_all.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas3_1.0.0-1_amd64.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
sudo dpkg -i libgoo*.deb
sudo rm -rf libgoo* -y

echo "正在安装压缩软件"
sudo apt install unrar guake p7zip-full  p7zip-rar  rar unzip -y

echo "正在安装kvm,android开发环境"
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils -y

echo "正在安装Xtreme Download Managert下载工具"
wget https://jaist.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
sudo ./install.sh
sudo rm -rf xdm-2018-x64.tar.xz install.sh readme.txt

echo "正在安装Motrix下载工具"
wget https://github.com/agalwood/Motrix/releases/download/v1.4.1/Motrix_1.4.1_amd64.deb
sudo dpkg -i Motrix*.deb
sudo rm -rf Motrix*

echo "正在安装kazam录屏软件"
sudo apt install kazam -y

echo "正在安装preload"
sudo apt-get install preload -y

echo "正在安装SpaceVim"
curl -sLf https://spacevim.org/cn/install.sh | bash

echo "正在安装wine"
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt update -y
sudo apt install --install-recommends winehq-stable -y


echo "正在安装gcc和g++"
sudo apt-get install gcc-5 gcc-5-multilib -y
sudo apt-get install g++-5 g++-5-multilib -y
sudo apt-get install gcc-6 gcc-6-multilib -y
sudo apt-get install g++-6 g++-6-multilib -y
sudo apt-get install gcc-7 gcc-7-multilib -y
sudo apt-get install g++-7 g++-7-multilib -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 60
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 70
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

echo "正在安装jdk1.8"
wget https://github.com/bytegriffin/java/releases/download/jdk/jdk-8u221-linux-x64.tar.gz
sudo mv jdk-* /opt/ide/jdk-linux-x64.tar.gz && tar xzf /opt/ide/jdk-*.tar.gz -C /opt/ide && rm -rf /opt/ide/jdk-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/ide/jdk1.8.0_211/bin/java 300  
sudo update-alternatives --install /usr/bin/javac javac /opt/ide/jdk1.8.0_211/bin/javac 300
sudo update-alternatives --config java
sudo update-alternatives --config javac

echo "正在安装golang"
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sudo mv go*.tar.gz /opt/ide/ && tar xzf /opt/ide/go*.tar.gz -C /opt/ide && rm -rf /opt/ide/go*.tar.gz

echo "正在安装python3 pip"
sudo apt-get install python3 python-pip python3-pip -y
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
sudo apt-get install python3-setuptools

echo "正在安装Mysql8 注意:选择采用5.x的加密方式"
wget https://repo.mysql.com/mysql-apt-config_0.8.9-1_all.deb
sudo dpkg -i mysql-*.deb
sudo apt update
sudo apt-get install mysql-server -y
sudo rm -rf mysql-*.deb

echo "正在安装DBBeaver"
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-*.deb
sudo apt update
sudo rm -rf dbeaver-*.deb

echo "正在安装Virtualbox"
wget https://download.virtualbox.org/virtualbox/6.0.12/virtualbox-6.0_6.0.12-133076~Ubuntu~bionic_amd64.deb
sudo dpkg -i virtualbox-*.deb
sudo apt update
sudo rm -rf virtualbox-*.deb

echo "正在安装docker"
sudo apt-get remove docker docker-engine docker.io
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt install aufs-tools cgroupfs-mount pigz
sudo apt-get install docker-ce -y

echo "正在安装nodejs"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs npm
sudo npm install -g nrm
nrm ls
nrm use taobao
sudo npm install -g webpack
sudo npm install -g gulp

echo "正在安装yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y
sudo apt-get install --no-install-recommends yarn

echo "正在安装markdown"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

echo "正在安装Cubic"
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
sudo apt update
sudo apt install cubic

echo "安装scala"
wget https://downloads.lightbend.com/scala/2.13.0/scala-2.13.0.tgz
sudo mv scala*.tgz /opt/ide && tar xzf /opt/ide/scala*.tgz -C /opt/ide && rm -rf /opt/ide/scala*.tgz

echo "正在安装mongodb"
wget https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.2/multiverse/binary-amd64/mongodb-org-server_4.2.0_amd64.deb
sudo dpkg -i mongodb-*.deb
sudo rm mongodb-*.deb

echo "正在安装VSCode"
wget https://vscode.cdn.azure.cn/stable/3db7e09f3b61f915d03bbfa58e258d6eee843f35/code_1.38.0-1567547996_amd64.deb
sudo dpkg -i code*.deb
sudo apt -f install -y
sudo rm code*.deb

echo "正在清理安装过程中产生的冗余软件包"
sudo apt autoremove --purge -y
sudo apt autoclean
sudo apt clean
sudo apt autoremove
