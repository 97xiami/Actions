斐讯分区刷入

启动脚本
```bash
touch /etc/bench.log
```

ip限速
```bash
iptables -t filter -I FORWARD -m limit -s 10.0.0.1 --limit 1000/s --limit-burst 100000 -j ACCEPT
iptables -t filter -I FORWARD -s 10.0.0.1 -j DROP
iptables -t filter -I FORWARD -m limit -d 10.0.0.1 --limit 1000/s --limit-burst 100000 -j ACCEPT
iptables -t filter -I FORWARD -d 10.0.0.1 -j DROP
```
