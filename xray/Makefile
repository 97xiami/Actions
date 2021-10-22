THISDIR​ = ​$(​shell​ pwd)
all​:config build compress

config:
	git clone --depth=1 https://github.com/XTLS/Xray-core; \
	wget -t5 --timeout=10 https://curl.se/ca/cacert.pem

build:
	cd Xray-core; \
	go env -w GO111MODULE=on; \
	GOOS=linux GOARCH=mipsle GOMIPS=softfloat go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main

compress:
	wget https://github.com/upx/upx/releases/download/v3.96/upx-3.96-amd64_linux.tar.xz; \
	tar xf upx-3.96-amd64_linux.tar.xz; \
	mv upx-3.96-amd64_linux/upx .; \
	./upx --best --lzma Xray-core/xray

romfs​:
	$(​ROMFSINST​)​ -p +x ​$(THISDIR)/Xray-core/xray /usr/bin/xray; \
	$(ROMFSINST) -p -x $(THISDIR)/cacert.pem /usr/lib/cacert.pem; \
	$(ROMFSINST) -p +x $(THISDIR)/run.sh /etc/storage/xray/run.sh
