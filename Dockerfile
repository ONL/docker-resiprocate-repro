  1 FROM centos
  2
  3 RUN yum upgrade -y \\
  4     && yum install -y epel-release \\
  5     && yum install -y \\
  6       wget resiprocate-repro \\
  7     && yum clean all
  8
  9 RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
 10 RUN chmod +x /usr/local/bin/dumb-init
 11
 12 EXPOSE 5060 5061 5080 5081 8443
 13 VOLUME /etc/repro
 14
 15 ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
 16 CMD ["/usr/sbin/repro"]
