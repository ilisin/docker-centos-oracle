FROM centos:7

MAINTAINER lisin gao <ilisin.gao@gmail.com>

ADD libaio-0.3.109-12.el7.x86_64.rpm /tmp/
ADD oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm /tmp/
ADD oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm /tmp/

RUN rpm -ivh /tmp/libaio-0.3.109-12.el7.x86_64.rpm
RUN rpm -ivh /tmp/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
RUN rpm -ivh /tmp/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm

RUN rm -rf /tmp/oracle*
RUN rm -rf /tmp/libaio*


ENV CGO_CFLAGS -I/usr/include/oracle/11.2/client64
ENV CGO_LDFLAGS -L/usr/lib/oracle/11.2/client64/lib
ENV LD_LIBRARY_PATH /usr/lib/oracle/11.2/client64/lib:/lib:/usr/lib:/usr/local/lib


#EXPOSE 22 

CMD ["/bin/sh"] 

