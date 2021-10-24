斐讯分区刷入

IP地址：10.0.0.1

用户名：root

密码：password

系统日志报错
```bash
touch /etc/bench.log
```

定时重启WAN口
```bash
30 5 * * * ifup wan
```

指定ip限速
```bash
iptables -t filter -I FORWARD -m limit -s 10.0.0.1 --limit 1000/s --limit-burst 100000 -j ACCEPT
iptables -t filter -I FORWARD -s 10.0.0.1 -j DROP
iptables -t filter -I FORWARD -m limit -d 10.0.0.1 --limit 1000/s --limit-burst 100000 -j ACCEPT
iptables -t filter -I FORWARD -d 10.0.0.1 -j DROP
```
