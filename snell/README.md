# snell-server-docker

自行挂载`snell-server`配置文件到`/etc/snell-server.conf`
配置示例：
```
[snell-server]
listen = 0.0.0.0:443
psk = xxx
obfs = tls或https
obfs-host = xxx
```