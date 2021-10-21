THISDIR​ = ​$(​shell​ pwd)
all​:clone build

clone:
  git clone --depth=1 https://github.com/XTLS/Xray-core

build:
  cd​ $(THISDIR)/​Xray-core \
  GOOS=linux GOARCH=mipsle go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main

clean:
  rm -rf Xray-core
  rm /usr/bin/xray
   
romfs​:
  $(​ROMFSINST​)​ -p +x ​$(THISDIR)/Xray-core/xray /usr/bin/xray
