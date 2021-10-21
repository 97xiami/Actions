DIR​ = ​$(​shell​ pwd)
all​:config build

config:
	git clone --depth=1 https://github.com/XTLS/Xray-core; \
	wget -t5 --timeout=10 https://curl.se/ca/cacert.pem

build:
	cd Xray-core; \
	go env -w GO111MODULE=on; \
	GOOS=linux GOARCH=mipsle go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main

romfs​:
	$(​ROMFSINST​)​ -p +x ​$(DIR)/Xray-core/xray /usr/bin/xray
	$(ROMFSINST) -p -x $(DIR)/cacert.pem /usr/lib/cacert.pem
