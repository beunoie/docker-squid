FROM debian:jessie
MAINTAINER beunoie
RUN apt-get clean && apt-get update && apt-get -y upgrade && apt-get -y install squid3
RUN mkdir -p /var/cache/squid3
RUN chown -R proxy:proxy /var/cache/squid3
ADD squid.conf /etc/squid3/squid.conf
RUN squid3 -z -F

EXPOSE 3128
# -N Don't run in daemon mode - mandatory for docker
CMD squid3 -N
