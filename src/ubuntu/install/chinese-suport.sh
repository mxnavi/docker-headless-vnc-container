#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install chinese suport"
apt-get update

/usr/share/locales/install-language-pack zh_CN
locale-gen zh_CN.UTF-8
dpkg-reconfigure --frontend noninteractive locales
apt-get -qqy --no-install-recommends install language-pack-zh-hans
apt-get -qqy --no-install-recommends install fonts-ipafont-gothic xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable
apt-get -qqy install ttf-wqy-microhei   && ln /etc/fonts/conf.d/65-wqy-microhei.conf /etc/fonts/conf.d/69-language-selector-zh-cn.conf
apt-get -qqy install tzdata
echo "Asia/Shanghai" | tee /etc/timezone   && dpkg-reconfigure --frontend noninteractive tzdata
apt-get -qqy --no-install-recommends install curl wget
apt-get  -qqy --no-install-recommends install fcitx*
mkdir -p /headless/.config


apt-get clean -y
