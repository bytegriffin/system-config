#!/bin/bash

echo 'Ubuntu 18.04 配置脚本 v2018.7.3'
echo '--------------------------------------------------

echo '请选择速度最快的那个软件源'
sudo software-properties-gtk

echo '正在更新软件包列表，请稍候。。。'
sudo apt-get update -y
sudo apt-get upgrade -y

echo '正在清理冗余软件包'
sudo apt remove --purge firefox aisleriot gnome-mahjongg gnome-mines gnome-sudoku onboard onboard-data gnome-mines cheese transmission-gtk transmission-common xterm unity-webapps-common onboard deja-dup -y

echo '正在调整屏幕默认亮度'
sudo apt install xbacklight -y
xbacklight = 40%

echo "正在安装fcitx输入法"
sudo apt-get install fcitx-bin fcitx-table fcitx-pinyin -y 

echo '正在下载搜狗输入法安装包'
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb

echo '正在安装搜狗输入法'
sudo dpkg -i sogoupinyin_2.2.0.0108_amd64.deb
sudo apt -f install -y
sudo rm sogoupinyin_2.2.0.0108_amd64.deb

echo '同步win10和ubuntu的系统时间'
sudo apt install timedatectl -y
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true

echo '安装监控CPU、网络的使用率'
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor  
sudo apt-get update  
sudo apt-get install indicator-sysmonitor -y
indicator-sysmonitor &

echo "install kolour paint"
sudo apt-get install kolourpaint4 -y 

echo "正在安装文泉驿字体套件"
sudo apt install fonts-wqy-microhei ttf-wqy-microhei -y

echo "正在安装Vim和Ntfs-config vim-youcompeteme"
sudo apt install vim vim-nox vim-youcompleteme -y

echo '正在更新gedit'
sudo apt install gedit -y
sudo apt install gsettings
gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['GB18030', 'UTF-8', 'CURRENT', 'ISO-8859-15','UTF-16']"

echo '正在安装常用软件'
sudo apt-get install wget ctags curl vsftpd git tmux meld htop putty subversion nload  iptraf iftop tree apt-transport-https ca-certificates curl software-properties-common -y

echo '正在安装exfat,ntfs-3g'
sudo apt-get install exfat-fuse exfat-utils ntfs-3g -y

echo '正在安装gconf-editor,dconf-editor'
sudo apt install gconf-editor dconf-editor

echo "设置窗口显示"
dconf  reset  -f   /org/compiz
dconf  reset  -f   /org/compizd
dconf reset -f  /org/compiz/current-profile
dconf reset -f  /org/compiz/existing-profiles
setsid unity
gsettings set com.canonical.Unity.Launcher launcher-position Bottom
sudo apt install compizconfig-settings-manager -y

echo "正在安装 oh-my-zsh"
sudo apt-get install zsh
chsh -s /bin/zsh
wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
echo 'source ~/.bashrc' >>~/.zshrc
echo 'source ~/.bash_profile' >>~/.zshrc

echo "正在安装alien openssh-client ntfs-config"
sudo apt install alien openssh-client ntfs-config -y

echo '正在安装新立得软件包管理器'
sudo apt install synaptic -y

echo '正在安装BleachBit系统清理工具'
sudo apt install bleachbit -y

echo '正在安装gdebi软件包安装程序'
sudo apt install gdebi -y

echo '正在安装Unity Tweak（用于更改主题和调整窗体设置等）'
sudo apt install unity-tweak-tool -y

echo "正在安装Flatabulous主题"
sudo add-apt-repository ppa:noobslab/themes -y
sudo apt update
sudo apt-get install flatabulous-theme -y

echo "正在安装ultra-flat-icons"
sudo add-apt-repository ppa:noobslab/icons -y
sudo apt-get update
sudo apt-get install ultra-flat-icons -y

echo '图标papirus'
sudo add-apt-repository ppa:papirus/papirus
sudo apt update 
sudo apt-get install papirus-icon-theme

echo '正在下载Google Chrome安装包'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo '正在替换浏览器为Google Chrome'
sudo apt install libappindicator1 -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo '正在安装Adobe Flash Player'
sudo apt install pepperflashplugin-nonfree

echo '正在下载WPS安装包'
wget http://kdl.cc.ksosoft.com/wps-community/download/6634/wps-office_10.1.0.6634_amd64.deb

echo '正在替换LibreOffice为WPS'
sudo dpkg -i wps-office_10.1.0.6634_amd64.deb
sudo rm wps-office_10.1.0.6634_amd64.deb
sudo apt remove --purge libreoffice-* -y

echo '安装解码器'
sudo apt-get install ubuntu-restricted-extras -y

echo '安装VLC视频播放器'
sudo apt-get install vlc browser-plugin-vlc -y

echo '播放器SMPlayer'
sudo apt-get install smplayer smplayer-themes -y

echo '安装FFmpeg'
sudo apt-get install ffmpeg -y

echo '正在下载网易云音乐安装包'
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb

echo '正在安装网易云音乐'
sudo dpkg -i netease-cloud-music_1.1.0_amd64_ubuntu.deb
sudo apt -f install -y
sudo rm netease-cloud-music_1.1.0_amd64_ubuntu.deb

#echo '正在配置网易云音乐'
#sudo gedit /usr/share/applications/netease-cloud-music.desktop
#Exec=netease-cloud-music %U   
#Exec=netease-cloud-music --no-sandbox %U

echo '正在安装 tweak-tool'
sudo apt-get install gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell gnome-session gtk2-engines-pixbuf libxml2-utils -y

echo '正在安装Arronax，用于创建或编辑启动器图标'
sudo add-apt-repository ppa:diesch/testing -y
sudo apt update
sudo apt install arronax -y

echo '正在安装Shutter截屏软件'
sudo apt install shutter -y
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas-common_1.0.0-1_all.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas3_1.0.0-1_amd64.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
sudo dpkg -i libgoo*.deb
sudo rm -rf libgoo* -y

echo '正在安装压缩软件'
sudo apt install unrar guake p7zip-full  p7zip-rar  rar unzip -y

echo '正在安装kvm,android开发环境'
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils -y

echo '正在安装Xtreme Download Managert下载工具'
wget https://jaist.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
sudo ./install.sh
sudo rm -rf xdm-2018-x64.tar.xz install.sh readme.txt

echo '正在安装kazam录屏软件'
sudo apt install kazam -y

echo '正在安装font manager字体管理工具'
sudo apt install font-manager -y

echo '正在安装jdk1.8'
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  -P /opt/ide http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz
sudo tar xzf /opt/ide/jdk-8u171-linux-x64.tar.gz -C /opt/ide && rm -rf /opt/ide/jdk-8u171-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/ide/jdk1.8.0_171/bin/java 300  
sudo update-alternatives --install /usr/bin/javac javac /opt/ide/jdk1.8.0_171/bin/javac 300
sudo update-alternatives --config java
sudo update-alternatives --config javac

echo '正在安装Mysql8 注意:选择采用5.x的加密方式'
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

echo '正在安装Virtualbox'
wget https://download.virtualbox.org/virtualbox/5.2.14/virtualbox-5.2_5.2.14-123301~Ubuntu~bionic_amd64.deb
sudo dpkg -i virtualbox-*.deb
sudo apt update
sudo rm -rf virtualbox-*.deb

echo "正在安装docker"
sudo apt-get remove docker docker-engine docker.io
sudo curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt install aufs-tools cgroupfs-mount pigz
sudo apt-get install docker-ce

echo "正在安装SDKMan"
sudo curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "正在安装nodejs"
sudo apt-get install nodejs npm -y

echo "正在安装markdown"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

echo '正在清理安装过程中产生的冗余软件包'
sudo apt autoremove --purge -y

echo '正在设置环境变量'
sudo echo "export JAVA_HOME=/opt/ide/jdk1.8.0_171" >> /etc/profile
sudo echo "export JRE_HOME=$JAVA_HOME/jre" >> /etc/profile
sudo echo "export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib" >> /etc/profile
sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile
sudo echo "export ANDROID_SDK_HOME=/opt/ide/android-sdk" >> /etc/profile
sudo echo "export PATH=$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools:$PATH" >> /etc/profile
sudo echo "export M2_HOME=/opt/ide/apache-maven-3.5.4" >> /etc/profile
sudo echo "export MAVEN_OPTS="-Xms256m -Xmx512m"" >> /etc/profile
sudo echo "export PATH=$M2_HOME/bin:$PATH" >> /etc/profile
sudo echo "export GRADLE_HOME=/opt/ide/gradle-4.8.1" >> /etc/profile
sudo echo "export PATH=$GRADLE_HOME/bin:$PATH" >> /etc/profile
sudo echo "export TOMCAT_HOME=/opt/ide/apache-tomcat-9.0.10" >> /etc/profile
sudo echo "export PATH=$TOMCAT_HOME/bin:$PATH" >> /etc/profile
sudo echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /etc/profile
sudo echo "export HADOOP_HOME=/opt/ide/hadoop-2.8.4" >> /etc/profile
sudo echo "export HADOOP_PREFIX=$HADOOP_HOME" >> /etc/profile
sudo echo "export HADOOP_INSTALL=$HADOOP_HOME" >> /etc/profile
sudo echo "export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH" >> /etc/profile
sudo echo "export HADOOP_MAPRED_HOME=$HADOOP_HOME" >> /etc/profile
sudo echo "export HADOOP_COMMON_HOME=$HADOOP_HOME" >> /etc/profile
sudo echo "export HADOOP_HDFS_HOME=$HADOOP_HOME" >> /etc/profile
sudo echo "export YARN_HOME=$HADOOP_HOME" >> /etc/profile
sudo echo "export HADOOP_CONF_DIR=$HADOOP_COMMON_HOME/etc/hadoop" >> /etc/profile
sudo echo "export HDFS_CONF_DIR=${HADOOP_HOME}/etc/hadoop" >> /etc/profile
sudo echo "export YARN_CONF_DIR=${HADOOP_HOME}/etc/hadoop" >> /etc/profile
sudo echo 'export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib:$HADOOP_COMMON_LIB_NATIVE_DIR"' >> /etc/profile
sudo echo "export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/:$LD_LIBRARY_PATH" >> /etc/profile
sudo echo "export HBASE_HOME=/opt/ide/hbase-2.0.1" >> /etc/profile
sudo echo "export PATH=$HBASE_HOME/bin:$PATH" >> /etc/profile
sudo echo "export HIVE_HOME=/opt/ide/hive-3.0.0" >> /etc/profile
sudo echo "export PATH=$PATH:$HIVE_HOME/bin" >> /etc/profile
sudo echo "export STORM_HOME=/opt/ide/storm-1.2.2" >> /etc/profile
sudo echo "export PATH=$PATH:$STORM_HOME/bin" >> /etc/profile
sudo echo "export ZOOKEEPER_HOME=/opt/ide/zookeeper-3.4.12" >> /etc/profile
sudo echo "export PATH=$PATH:$ZOOKEEPER_HOME/bin" >> /etc/profile
sudo echo "export KAFKA_HOME=/opt/ide/kafka_2.12-1.1.0" >> /etc/profile
sudo echo "export PATH=$PATH:$KAFKA_HOME/bin" >> /etc/profile
sudo echo "export SCALA_HOME=/opt/ide/scala-2.12.6" >> /etc/profile
sudo echo "export PATH=${SCALA_HOME}/bin:$PATH" >> /etc/profile
sudo echo "export SPARK_HOME=/opt/ide/spark-2.3.1" >> /etc/profile
sudo echo "export PATH=$PATH:$SPARK_HOME/bin" >> /etc/profile
sudo echo "export DRILL_HOME=/opt/ide/drill-1.13.0" >> /etc/profile
sudo echo "export PATH=$PATH:$DRILL_HOME/bin" >> /etc/profile
sudo echo "export MONGODB_HOME=/opt/ide/mongodb" >> /etc/profile
sudo echo "export PATH=$PATH:$MONGODB_HOME/bin" >> /etc/profile
sudo echo "export REDIS_HOME=/opt/ide/redis-4.0.9" >> /etc/profile
sudo echo "export PATH=$PATH:$REDIS_HOME/bin" >> /etc/profile
sudo echo "export FLINK_HOME=/opt/ide/flink-1.5.0" >> /etc/profile
sudo echo "export PATH=$PATH:$FLINK_HOME/bin" >> /etc/profile
sudo echo "export PRESTO_HOME=/opt/ide/presto-server-0.205" >> /etc/profile
sudo echo "export PATH=$PATH:$PRESTO_HOME/bin" >> /etc/profile
sudo echo "export FLUME_HOME=/opt/ide/flume-1.8.0" >> /etc/profile
sudo echo "export PATH=$PATH:$FLUME_HOME/bin" >> /etc/profile
source /etc/profile



















