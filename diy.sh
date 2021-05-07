#!bin/sh
cd /opt/rt-n56u/trunk/configs/templates

sed -i 's/SMBD36=y/SMBD36=n/g' K2P_nano.config
sed -i 's/EAP_PEAP=y/EAP_PEAP=n/g' K2P_nano.config
sed -i 's/SFTP=y/SFTP=n/g' K2P_nano.config
sed -i 's/OPENSSH=y/OPENSSH=n/g' K2P_nano.config
sed -i 's/OPENSSL_EC=y/OPENSSL_EC=n/g' K2P_nano.config
sed -i 's/XUPNPD=y/XUPNPD=n/g' K2P_nano.config
sed -i 's/FFMPEG_NEW=y/FFMPEG_NEW=n/g' K2P_nano.config
sed -i 's/CURL=y/CURL=n/g' K2P_nano.config
sed -i 's/TTYD=y/TTYD=n/g' K2P_nano.config
sed -i 's/HTOP=y/HTOP=n/g' K2P_nano.config
sed -i 's/NANO=y/NANO=n/g' K2P_nano.config
sed -i 's/IPERF3=y/IPERF3=n/g' K2P_nano.config
sed -i 's/MTR=y/MTR=n/g' K2P_nano.config
sed -i 's/SOCAT=y/SOCAT=n/g' K2P_nano.config
sed -i 's/SRELAY=y/SRELAY=n/g' K2P_nano.config
