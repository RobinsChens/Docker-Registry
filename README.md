Docker-Registry
===============


About Docker and Docker registry
======================
What is docker? <a href = "https://www.docker.com/">here!</a>

什么是Docker？<a href = "https://www.docker.com/">这里！</a>

And what is docker registry?<a href = "https://github.com/docker/docker-registry/">here!</a>

那docker registry又是什么？<a href = "https://github.com/docker/docker-registry/">这里！</a>

About this document
===================

Depend docker registry on local ubuntu14.04 machine.

在本地ubuntu14.04部署docker registry。

> CN user should modify the following configuration files,it is **necessary** for you to install **faster**.

> 中国用户应该修改以下配置文件，这样可以**加速部署**。

> *   ubuntu系统更新软件源，参考http://mirrors.aliyun.com/help/ubuntu

> *   pypi国内源，加速下载，参考http://mirrors.aliyun.com/help/pypi ，**如果不进行配置很有可能因为国外源更新不稳定导致安装失败**。

> 文末有配置示例。

Quick start
================
```
git clone https://github.com/angeiv/Docker-Registry
chmod +x Docker-registry.sh
./Docker-registry.sh
```
Configuration example
==================

*  Ubuntu 14.04.1 LTS 国内源

```
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted
 
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted

deb http://mirrors.aliyun.com/ubuntu/ trusty universe
deb-src http://mirrors.aliyun.com/ubuntu/ trusty universe
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates universe
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates universe

deb http://mirrors.aliyun.com/ubuntu/ trusty multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates multiverse

deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
    
deb http://mirrors.aliyun.com/ubuntu trusty-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu trusty-security main restricted
deb http://mirrors.aliyun.com/ubuntu trusty-security universe
deb-src http://mirrors.aliyun.com/ubuntu trusty-security universe
deb http://mirrors.aliyun.com/ubuntu trusty-security multiverse
deb-src http://mirrors.aliyun.com/ubuntu trusty-security multiverse
```

*  pypi配置

  在~/.pip/pip.conf文件中添加或修改
```
[global]
index-url = http://pypi.douban.com/simple
```
