#!/bin/bash

echo "Manjaro 18.0.4 配置脚本 v2019.9.9"
echo "--------------------------------------------------"

echo "切换中国源"
sudo pacman-mirrors -c China

sudo cat>>/etc/pacman.conf<<EOF
[archlinuxcn] 
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch
[arch4edu]
SigLevel = Never
Server = http://mirrors.tuna.tsinghua.edu.cn/arch4edu/\$arch
EOF

echo "更新软件源并导入公钥"
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring -y

echo "删除没用的软件"
sudo pacman -Rsc --noconfirm firefox hexchat pidgin

echo "安装常用软件"
sudo pacman -S --noconfirm yay yaourt base-devel flashplugin vim gedit albert autojump foxitreader vlc mpv filezilla gcc make pkg-config libv4l numix-icon-theme virtualgl lib32-virtualgl lib32-primus primus tcl

echo "安装Gedit"
sudo pacman -S --noconfirm gedit
gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['GB18030', 'UTF-8', 'CURRENT', 'ISO-8859-15','UTF-16']"

echo "安装fcitx输入法"
sudo pacman -S --noconfirm fcitx fcitx-im fcitx-configtool fcitx-sogoupinyin

echo "同步时间"
sudo timedatectl set-local-rtc true

sudo vim ~/.profile
sudo cat>>/etc/pacman.conf<<EOF
export LC_CTYPE=zh_CN.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
EOF

echo "安装Nvdia Driver"
inxi -G
sudo mhwd -a pci nonfree 0300

echo "安装常用软件"
yay -S  --noconfirm google-chrome netease-cloud-music wps-office ttf-wps-fonts typora GitKraken debtap thefuck arc-gtk-theme clang make cmake gdb visual-studio-code-bin wqy-microhei wqy-zenhei vsftpd gnupg gnupg2 tmux meld htop putty subversion nload iftop tree ca-certificates exfat-utils ntfs-3g gconf-editor dconf-editor bleachbit smplayer smplayer-themes ffmpeg unity-tweak-tool gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell gnome-session unrar guake rar unzip p7zip preload gcc gcc5 gcc6 gcc7 datagrip postman-bin mame nmap zmap yarn  deepin-screenshot deepin.com.qq.im deepin.com.qq.office
echo "更新debtap"
sudo debtap -u

echo "正在安装SpaceVim"
curl -sLf https://spacevim.org/cn/install.sh | bash

echo "安装zsh"
sudo pacman -S zsh
echo "安装oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "更换默认的shell"
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
sudo gedit ~/.zshrc
修改主题：ZSH_THEME
ZSH_THEME="agnoster"
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	autojump
)
source  ~/.zshrc

echo "安装jdk1.8"
wget https://github.com/bytegriffin/java/releases/download/jdk/jdk-8u231-linux-x64.tar.gz
sudo tar xzf jdk-*.tar.gz -C /opt/ide && rm -rf jdk-*.tar.gz
sudo archlinux-java status
sudo archlinux-java set java-8-jdk

echo "正在安装flutter"
wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.5-stable.tar.xz
sudo tar xf flutter_*.tar.xz -C /opt/ide && rm -rf flutter_*.tar.xz

echo "安装Golang"
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sudo tar xzf go*.tar.gz -C /opt/ide && rm -rf go*.tar.gz

echo "正在安装redis"
wget http://download.redis.io/releases/redis-5.0.7.tar.gz
sudo tar xzf redis*.tar.gz -C /opt/ide && rm -rf redis*.tar.gz
cd /opt/ide/redis-* && make

echo "安装python"
yay -S --needed --noconfirm python python3 python-pip python2-pip python-setuptools python2-setuptools python-virtualenv python2-virtualenv python-virtualenvwrapper

echo "安装mysql8"
yay -S --noconfirm mysql mycli
sudo systemctl enable mysql
sudo systemctl start mysql
mysql> use mysql  
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';  
mysql> FLUSH PRIVILEGES;

echo "安装dbeaver"
wget https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz
sudo tar xzf dbeaver*.tar.gz -C /opt/ide && rm -rf dbeaver*.tar.gz

echo "安装Virtualbox"
yay -S --noconfirm virtualbox virtualbox-ext-oracle linux414-virtualbox-host-modules

echo "安装docker"
yay -S --noconfirm docker docker-compose
sudo gpasswd -a bytegriffin docker
sudo systemctl enable docker
sudo systemctl start docker

echo "正在设置daocloud.io，打开https://www.daocloud.io/mirror，可以看到具体地址"
sudo tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": ["http://f1361db2.m.daocloud.io"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "安装nodejs"
yay -S --noconfirm nodejs npm 
sudo npm install -g nrm
nrm ls
nrm use taobao
sudo npm install -g webpack
sudo npm install -g gulp

echo "安装scala"
wget https://downloads.lightbend.com/scala/2.13.0/scala-2.13.0.tgz
sudo tar xzf /opt/ide/scala*.tgz -C /opt/ide && rm -rf scala*.tgz

echo "正在安装VSCode"
wget https://vscode.cdn.azure.cn/stable/26076a4de974ead31f97692a0d32f90d735645c0/code-stable-1576682093.tar.gz
sudo tar xzf /opt/ide/code*.tar.gz -C /opt/ide && rm -rf code*.tar.gz

echo "清除系统中无用的包"
sudo pacman -R --noconfirm $(pacman -Qdtq)
sudo pacman -Scc
sudo journalctl --vacuum-size=50M
yay -c  

