# Unbound DNS Server

FROM centos:centos7
MAINTAINER Warren Baker <warren@tph.io>

RUN yum -y install unbound
COPY run-unbound.sh /run-unbound.sh

EXPOSE 53

CMD [ "/run-unbound.sh" ]
