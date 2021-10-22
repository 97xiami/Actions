#!/usr/bin/bash

func_start(){
  xray -c /etc/storage/xray/config.json
  iptables -t nat -N XRAY
  iptables -t nat -A XRAY -d 0.0.0.0/8 -j RETURN
  iptables -t nat -A XRAY -d 127.0.0.0/8 -j RETURN
  iptables -t nat -A XRAY -d 10.0.0.0/24 -j RETURN
  iptables -t nat -A XRAY -s 10.0.0.0/24 -p tcp -j REDIRECT --to-ports 12345
  iptables -t nat -A PREROUTING -p tcp -j XRAY
  iptables -t nat -A OUTPUT -p tcp -j XRAY
}

func_stop(){
  iptables -t nat -D XRAY
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
