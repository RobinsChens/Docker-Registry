#!/bin/bash

clear

echo "Author: Angeiv Zhang (Xing Zhang)"
echo "https://github.com/angeiv"
echo "License: GNU GENERAL PUBLIC LICENSE"

#Run as root user
echo "1.Checking user..."
echo "1.正在检测用户..."
sleep 1
if [ $UID = 0 ];then
	echo -e "\tAll good..."
	echo -e "\t权限检测正确..."
else
	echo -e "\tYou must run as root."
	echo -e "\t请用root用户执行此脚本。"
	exit
fi

sleep 1

#Check system version,run on ubuntu 14.04
echo "2.Checking system version..."
echo "2.正在检测系统版本..."
sleep 1
if [[ `cat /etc/issue | grep "14.04" | awk '{print $2}' | cut -c 1-5` = "14.04" ]];then
	echo -e "\tSystem version matched."
	echo -e "\t系统版本正确。"
else
	echo -e "\tYou must run on Ubuntu 14.04."
	echo -e "\t此脚本必须在Ubuntu 14.04上运行。"
	exit
fi

sleep 1

#Update system
echo "3.Updating system..."
echo "3.正在更新系统..."
sleep 1
apt-get update -y && apt-get upgrade -y

sleep 1

#Check git
echo "4.Checking for git..."
echo "4.正在检查git是否安装..."

sleep 1

if [[ `dpkg -l | grep -iw 'git[^-]' | awk '{print $1}' | cut -c 1-2` = "ii" ]];then
	echo -e "\tGit have been already installed."
	echo -e "\tgit已经安装。"
else
	echo -e "\tInstalling git..."
	echo -e "\t安装git..."
	sleep 1
	apt-get install -y git
	echo -e "\tGit have been already installed."
        echo -e "\tgit已经安装。"
fi

sleep 1

#Pull docker registry
echo "5.Pulling docker registry..."
echo "5.正在下载docker registry文件..."

sleep 1

git clone https://github.com/docker/docker-registry

echo -e "\tDownload complete!"
echo -e "\t下载完毕！"

sleep 1

#Install required dependencies
echo "6.Installing required dependencies..."
echo "6.正在安装依赖文件..."

sleep 1

apt-get install -y python-pip python-dev liblzma-dev libevent1-dev

echo -e "\tInstalled complete!"
echo -e "\t安装完毕！"

sleep 1

#Copy files to /docker-registry
echo "7.Copying files to /docker-registry..."
echo "7.正在将文件复制到/docker-registry..."

sleep 1

mkdir /docker-registry
cp -r docker-registry /
echo -e "\tCopying config files..."
echo -e "\t正在复制配置文件..."

cp ./docker-registry/config/boto.cfg /etc/boto.cfg

echo -e "\tFiles have been copyed!"
echo -e "\t文件已经复制完毕！"

sleep 1

#Install core files
echo "8.Installing core files..."
echo "8.正在安装核心文件..."

sleep 1

pip install /docker-registry/depends/docker-registry-core

echo -e "\tCore files have been installed!"
echo -e "\t核心文件安装完毕！"

sleep 1

#Install registry

echo "9.Installing docker registry..."
echo "9.正在安装docker registry..."

sleep 1

pip install file:///docker-registry#egg=docker-registry[bugsnag,newrelic,cors]

echo -e "\tFiles have been installed!"
echo -e "\t文件已经安装完毕！"

sleep 1

#Patch

echo "10.Patching..."
echo "10.正在安装补丁..."

sleep 1

patch $(python -c 'import boto; import os; print os.path.dirname(boto.__file__)')/connection.py < /docker-registry/contrib/boto_header_patch.diff

echo -e "\tComplete!"
echo -e "\t安装完毕！"

sleep 1

#Set env
echo "11.Seting enviroment variables..."
echo "11.正在设置环境变量..."

sleep 1

export DOCKER_REGISTRY_CONFIG="docker-registry/config/config_sample.yml"
export SETTINGS_FLAVOR="local"


echo -e "\tEnviromen variables have been set!"
echo -e "\t环境变量已经设置完毕"

sleep 1

#Copy some important files
echo "12.Copying some important files..."
echo "12.正在复制一些重要文件..."

sleep 1

cp /docker-registry/config/config_sample.yml /usr/local/lib/python2.7/dist-packages/docker_registry/lib/../../config/config.yml
mkdir -p /usr/local/lib/python2.7/dist-packages/docker_registry/lib/../../config/docker-registry/config/
cp /docker-registry/config/config_sample.yml /usr/local/lib/python2.7/dist-packages/docker_registry/lib/../../config/docker-registry/config/config_sample.yml

echo -e "\tFiles have been Copied!"
echo -e "\t文件已经复制！"

sleep 1

#Run docker registry
echo "13.Run docker registry,use \"docker-registry\" command,you can add command in /etc/rc.local"
echo "13.安装完毕，可以执行docker-registry命令启动，可以将命令加入/etc/rc.local开机自动执行"