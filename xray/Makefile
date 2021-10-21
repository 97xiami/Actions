DIR​ = ​$(​shell​ pwd)
all​:clean clone build

clone:
git clone --depth=1 https://github.com/XTLS/Xray-core

build:
cd Xray-core; \
go env -w GO111MODULE=auto; \
GOOS=linux GOARCH=mipsle go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main

clean:
rm -rf Xray-core

romfs​:
$(​ROMFSINST​)​ -p +x ​$(DIR)/Xray-core/xray /usr/bin/xray
