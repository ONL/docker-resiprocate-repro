FROM centos:7

RUN yum upgrade -y \
    && yum install -y epel-release \
    && yum install -y \
      wget resiprocate-repro \
    && yum clean all

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

RUN sed -i 's/Daemonize = true/Daemonize = false/' /etc/repro/repro.config

EXPOSE 5060 5061 5080 5081 8443
EXPOSE 5060/udp

VOLUME /etc/repro
VOLUME /var/lib/repro

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/usr/sbin/repro", "/etc/repro/repro.config"]
