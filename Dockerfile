FROM centos
LABEL atuhor="SHY" 
RUN yum install -y gcc
RUN yum install -y go
# config GOROOT
ENV GOROOT /usr/lib/golang
ENV PATH=$PATH:/usr/lib/golang/bin
ENV GOPROXY https://goproxy.cn
 
# config GOPATH
RUN mkdir -p /root/gopath
RUN mkdir -p /root/gopath/src
RUN mkdir -p /root/gopath/pkg
RUN mkdir -p /root/gopath/bin
ENV GOPATH /root/gopath

# copy source files
RUN mkdir -p /root/gopath/src/server
COPY main.go /root/gopath/src/server/

# build the server
WORKDIR /root/gopath/src/server
RUN go build -o server.bin main.go

# startup the server
CMD /root/gopath/src/server/server.bin
#CMD /bin/bash
