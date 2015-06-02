FROM ubuntu
MAINTAINER Steven Bower <sbower@alcyon.net>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
      curl

ENV JAVA_MAJOR 8
ENV JAVA_MINOR 45
ENV JAVA_BUILD b14
ENV JAVA_VERSION ${JAVA_MAJOR}u${JAVA_MINOR}
ENV JAVA_HOME /jdk1.${JAVA_MAJOR}.0_${JAVA_MINOR}

RUN curl -L -b "oraclelicense=a" "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-${JAVA_BUILD}/jdk-${JAVA_VERSION}-linux-x64.tar.gz" | tar -C / -xzf -

ENV PATH $PATH:${JAVA_HOME}/bin
