FROM centos

RUN yum upgrade -y \\
    && yum install -y epel-release \\
    && yum install -y \\
      wget resiprocate-repro \\
    && yum clean all

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

EXPOSE 5060 5061 5080 5081 8443
VOLUME /etc/repro

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/usr/sbin/repro", "/etc/repro/repro.config"]
