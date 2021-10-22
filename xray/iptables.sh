#!​/bin/sh
#​ set iptables rules
iptables -t nat -D XRAY
iptables -t nat -N XRAY
iptables -t nat -A XRAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A XRAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A XRAY -d 10.0.0.0/24 -j RETURN
#​ From lans redirect to Dokodemo-door's local port
iptables -t nat -A XRAY -s 10.0.0.0/24 -p tcp -j REDIRECT --to-ports 12345 
iptables -t nat -A PREROUTING -p tcp -j XRAY
iptables -t nat -A OUTPUT -p tcp -j XRAY
