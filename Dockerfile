FROM debian:wheezy
MAINTAINER Steven Bower <sbower@alcyon.net>

ENV LANG C.UTF-8
ENV JAVA_HOME /opt/jdk

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -q -y --no-install-recommends curl \
    && curl -k -L -b "oraclelicense=a" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz" | tar -C / -xzf - \
    && mv /jdk1.8.0_45 /opt/jdk \
    && apt-get purge -q -y curl libldap-2.4-2 libsasl2-2 libgcrypt11 libgpg-error0 \
    && apt-get autoremove -q -y --purge \
    && apt-get clean -q -y \
    && rm -rf /var/lib/apt/lists/*

