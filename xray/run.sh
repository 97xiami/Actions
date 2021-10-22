#!/usr/bin/bash

func_start(){
  xray -c /etc/storage/xray/config.json
  iptables -t mangle -N XRAY
  iptables -t mangle -A XRAY -d 127.0.0.0/8 -j RETURN
  iptables -t mangle -A XRAY -d 255.255.255.255/32 -j RETURN
  iptables -t mangle -A XRAY -d 10.0.0.0/24 -p tcp ! --dport 53 -j RETURN
  iptables -t mangle -A XRAY -d 10.0.0.0/24 -p udp ! --dport 53 -j RETURN
  iptables -t mangle -A XRAY -p tcp -j TPROXY --on-port 12345 --tproxy-mark 1
  iptables -t mangle -A XRAY -p udp -j TPROXY --on-port 12345 --tproxy-mark 1
  iptables -t mangle -A PREROUTING -j XRAY

  iptables -t mangle -N XRAY_SELF
  iptables -t mangle -A XRAY_SELF -d 127.0.0.0/8 -j RETURN
  iptables -t mangle -A XRAY_SELF -d 255.255.255.255/32 -j RETURN
  iptables -t mangle -A XRAY_SELF -d 10.0.0.0/24 -p tcp ! --dport 53 -j RETURN
  iptables -t mangle -A XRAY_SELF -d 10.0.0.0/24 -p udp ! --dport 53 -j RETURN
  iptables -t mangle -A XRAY_SELF -m mark --mark 2 -j RETURN
  iptables -t mangle -A XRAY_SELF -p tcp -j MARK --set-mark 1
  iptables -t mangle -A XRAY_SELF -p udp -j MARK --set-mark 1
  iptables -t mangle -A OUTPUT -j XRAY_SELF
}

func_stop(){
  iptables -t mangle -D XRAY
  iptables -t mangle -D XRAY_SELF
  killall -9 xray
}

case "$1" in
start)
  func_start
;;
stop)
  func_stop
;;
restart)
  func_stop
  func_start
;;
*)
  echo "Usage: $0 {start | stop | restart}"
  exit 1
esac
