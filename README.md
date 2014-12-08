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
cd Docker-registry
chmod +x Docker-Registry.sh
./Docker-Registry.sh
```

You will see the information are given below when you install docker registry success:

如果安装成功，你会看到如下信息：

```
angeiv@Registry:~$ docker-registry
2014-12-08 23:18:12 [23714] [INFO] Starting gunicorn 19.1.0
2014-12-08 23:18:12 [23714] [INFO] Listening at: http://0.0.0.0:5000 (23714)
2014-12-08 23:18:12 [23714] [INFO] Using worker: gevent
2014-12-08 23:18:12 [23721] [INFO] Booting worker with pid: 23721
2014-12-08 23:18:13 [23722] [INFO] Booting worker with pid: 23722
2014-12-08 23:18:13 [23723] [INFO] Booting worker with pid: 23723
2014-12-08 23:18:13 [23724] [INFO] Booting worker with pid: 23724
2014-12-08 23:18:13 [23714] [INFO] 4 workers
08/Dec/2014:23:18:19 +0000 WARNING: Cache storage disabled!
08/Dec/2014:23:18:19 +0000 WARNING: LRU cache disabled!
08/Dec/2014:23:18:19 +0000 WARNING: Cache storage disabled!
08/Dec/2014:23:18:19 +0000 WARNING: LRU cache disabled!
08/Dec/2014:23:18:19 +0000 WARNING: Cache storage disabled!
08/Dec/2014:23:18:19 +0000 WARNING: LRU cache disabled!
08/Dec/2014:23:18:19 +0000 WARNING: Cache storage disabled!
08/Dec/2014:23:18:19 +0000 WARNING: LRU cache disabled!
08/Dec/2014:23:18:19 +0000 DEBUG: Will return docker-registry.drivers.file.Storage
08/Dec/2014:23:18:19 +0000 DEBUG: Will return docker-registry.drivers.file.Storage
08/Dec/2014:23:18:19 +0000 DEBUG: Will return docker-registry.drivers.file.Storage
08/Dec/2014:23:18:19 +0000 DEBUG: Will return docker-registry.drivers.file.Storage
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

Q&A
======================
Q: Red information?如果看到红色文字提示，如下：
```
Exception:
Traceback (most recent call last):
  File "/usr/lib/python2.7/dist-packages/pip/basecommand.py", line 122, in main
    status = self.run(options, args)
  File "/usr/lib/python2.7/dist-packages/pip/commands/install.py", line 278, in run
    requirement_set.prepare_files(finder, force_root_egg_info=self.bundle, bundle=self.bundle)
  File "/usr/lib/python2.7/dist-packages/pip/req.py", line 1197, in prepare_files
    do_download,
  File "/usr/lib/python2.7/dist-packages/pip/req.py", line 1375, in unpack_url
    self.session,
  File "/usr/lib/python2.7/dist-packages/pip/download.py", line 572, in unpack_http_url
    download_hash = _download_url(resp, link, temp_location)
  File "/usr/lib/python2.7/dist-packages/pip/download.py", line 433, in _download_url
    for chunk in resp_read(4096):
  File "/usr/lib/python2.7/dist-packages/pip/download.py", line 421, in resp_read
    chunk_size, decode_content=False):
  File "/usr/lib/python2.7/dist-packages/urllib3/response.py", line 225, in stream
    data = self.read(amt=amt, decode_content=decode_content)
  File "/usr/lib/python2.7/dist-packages/urllib3/response.py", line 174, in read
    data = self._fp.read(amt)
  File "/usr/lib/python2.7/httplib.py", line 567, in read
    s = self.fp.read(amt)
  File "/usr/lib/python2.7/socket.py", line 380, in read
    data = self._sock.recv(left)
  File "/usr/lib/python2.7/ssl.py", line 341, in recv
    return self.read(buflen)
  File "/usr/lib/python2.7/ssl.py", line 260, in read
    return self._sslobj.read(len)
SSLError: The read operation timed out

Storing debug log for failure in /home/angeiv/.pip/pip.log
```
A:Internet.国内用户可能因为网络原因导致pypi下载失败，请更换源或者重新安装。

Q：Some Error?有错误提示：
```
10.Patching...
10.正在安装补丁...
patching file /usr/local/lib/python2.7/dist-packages/boto/connection.py
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n] n
Skipping patch.
```
A：Enter is OK.之前安装过，重新安装时在这里提示，直接默认操作回车即可。第一个问你是不是想还原，如果选n，那么代表不还原，接下来就询问是不是还是要应用该补丁。
