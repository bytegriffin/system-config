#!/bin/bash

echo "Linuxmint 19 Cinnamon 配置脚本 v2018.7.3"
echo "--------------------------------------------------"

echo "请选择速度最快的那个软件源"
sudo software-properties-gtk

echo "正在更新软件包列表，请稍候。。。"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "正在清理冗余软件包"
sudo apt remove --purge firefox  onboard gnome-mines transmission-gtk transmission-common xterm unity-webapps-common onboard -y

echo "正在调整屏幕默认亮度"
sudo apt install xbacklight -y
xbacklight = 40%

echo "正在安装fcitx输入法"
sudo apt-get install fcitx-bin fcitx-table fcitx-pinyin  fcitx-config-common fcitx-config-gtk -y 

echo "正在下载搜狗输入法安装包"
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb

echo "正在安装搜狗输入法"
sudo dpkg -i sogoupinyin_2.2.0.0108_amd64.deb
sudo apt -f install -y
sudo rm sogoupinyin_2.2.0.0108_amd64.deb

echo "正在安装Vim和Ntfs-config vim-youcompeteme"
sudo apt install vim vim-nox vim-youcompleteme -y

echo "正在更新gedit"
sudo apt install gedit -y
gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['GB18030', 'UTF-8', 'CURRENT', 'ISO-8859-15','UTF-16']"

echo "正在安装 oh-my-zsh"
sudo apt-get install zsh -y
chsh -s /bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "同步win10和ubuntu的系统时间"
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true

echo "安装kolourpaint"
sudo apt-get install kolourpaint4 -y 

echo "正在安装文泉驿字体套件"
sudo apt install fonts-wqy-microhei ttf-wqy-microhei -y

echo "正在安装常用软件"
sudo apt-get install wget ctags curl vsftpd git tmux meld htop putty subversion nload iptraf iftop tree apt-transport-https ca-certificates software-properties-common -y

echo "正在安装exfat,ntfs"
sudo apt-get install exfat-fuse exfat-utils ntfs-3g -y

echo "正在安装gconf-editor,dconf-editor"
sudo apt install gconf-editor dconf-editor -y


echo "正在安装alien openssh-client ntfs-config"
sudo apt install alien openssh-client ntfs-config -y

echo "正在安装新立得软件包管理器"
sudo apt install synaptic -y

echo "正在安装BleachBit系统清理工具"
sudo apt install bleachbit -y

echo "正在安装gdebi软件包安装程序"
sudo apt install gdebi -y

echo "正在下载Google Chrome安装包"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "正在替换浏览器为Google Chrome"
sudo apt install libappindicator1 -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo "正在安装Adobe Flash Player"
sudo apt install pepperflashplugin-nonfree

echo "安装解码器"
sudo apt-get install ubuntu-restricted-extras -y

echo "正在安装VLC视频播放器"
sudo apt-get install vlc browser-plugin-vlc -y

echo "正在播放器SMPlayer"
sudo apt-get install smplayer smplayer-themes -y

echo "安装FFmpeg"
sudo apt-get install ffmpeg -y

echo "正在下载网易云音乐安装包"
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
sudo dpkg -i netease-*.deb
sudo apt -f install -y
sudo rm netease-*.deb

#echo "正在配置网易云音乐"
#sudo gedit /usr/share/applications/netease-cloud-music.desktop
#Exec=netease-cloud-music %U   
#Exec=netease-cloud-music --no-sandbox %U

echo "正在安装Xdman"
wget https://jaist.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
sudo ./install.sh
sudo rm -rf xdm-2018-x64.tar.xz readme.txt

echo "正在安装 tweak-tool"
sudo apt-get install unity-tweak-tool gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell gnome-session gtk2-engines-pixbuf libxml2-utils -y

echo "正在安装Shutter截屏软件"
sudo apt install shutter -y
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas-common_1.0.0-1_all.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas3_1.0.0-1_amd64.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
sudo dpkg -i libgoo*.deb
sudo rm -rf libgoo*

echo "正在安装压缩软件"
sudo apt install unrar guake p7zip-full  p7zip-rar  rar unzip -y

echo "正在安装kvm,android开发环境"
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils -y

echo "正在安装Xtreme Download Managert下载工具"
wget https://jaist.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
sudo ./install.sh
sudo rm -rf xdm-2018-x64.tar.xz install.sh readme.txt

echo "正在安装kazam录屏软件"
sudo apt install kazam -y

echo "正在安装font manager字体管理工具"
sudo apt install font-manager -y

echo "正在安装兰灯"
wget http://s3.amazonaws.com/urtuz53txrmk9/lantern-installer-beta-64-bit.deb
sudo dpkg -i lantern*.deb
sudo rm -rf lantern*

echo "正在安装jdk1.8"
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  -P /opt/ide http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz
sudo tar xzf /opt/ide/jdk-8u171-linux-x64.tar.gz -C /opt/ide && rm -rf /opt/ide/jdk-8u171-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/ide/jdk1.8.0_171/bin/java 300  
sudo update-alternatives --install /usr/bin/javac javac /opt/ide/jdk1.8.0_171/bin/javac 300
sudo update-alternatives --config java
sudo update-alternatives --config javac

echo "正在安装Mysql8 注意:选择采用5.x的加密方式"
wget https://repo.mysql.com//mysql-apt-config_0.8.10-1_all.deb
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
wget https://download.virtualbox.org/virtualbox/5.2.14/virtualbox-5.2_5.2.14-123301~Ubuntu~bionic_amd64.deb
sudo dpkg -i virtualbox-*.deb
sudo apt update
sudo rm -rf virtualbox-*.deb

echo "正在安装docker"
sudo apt-get remove docker docker-engine docker.io -y
sudo curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt install aufs-tools cgroupfs-mount pigz -y
sudo apt-get update 
sudo apt-get install docker-ce -y

echo "正在安装SDKMan"
sudo curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "正在安装nodejs"
sudo apt-get install nodejs npm -y

echo "正在安装markdown"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository "deb https://typora.io/linux ./"
sudo apt-get update
sudo apt-get install typora -y

echo "正在清理安装过程中产生的冗余软件包"
sudo apt autoremove --purge -y

