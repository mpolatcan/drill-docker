FROM ubuntu:16.04

ARG DRILL_VERSION=1.13.0

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

ENV DRILL_HOME "/usr/local/drill"
ENV DRILL_CONF_DIR "usr/local/drill/conf"
ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
ENV PATH $PATH:$JAVA_HOME/bin:$DRILL_HOME/bin

ENV DRILL_MODE "embedded"
ENV DRILL_CLUSTER_ID "NULL"
ENV DRILL_ZOOKEEPER_CONNECT "NULL"
ENV DRILL_DRILLBIT_MAX_PROC_MEM "NULL"
ENV DRILL_DRILL_HEAP "NULL"
ENV DRILL_DRILL_MAX_DIRECT_MEMORY "NULL"
ENV DRILL_DRILLBIT_CODE_CACHE_SIZE "NULL"
ENV DRILL_DRILL_HOST_NAME "NULL"
ENV DRILL_DRILL_LOG_NAME "drillbit"
ENV DRILL_DRILL_LOG_DIR "NULL"
ENV DRILL_DRILL_JAVA_OPTS "NULL"
ENV DRILL_DRILLBIT_JAVA_OPTS "NULL"
ENV DRILL_SQLLINE_JAVA_OPTS "NULL"
ENV DRILL_DRILL_SHELL_JAVA_OPTS "NULL"
ENV DRILL_DRILL_TMP_DIR "NULL"

COPY entrypoint.sh ./

RUN apt-get update && \
    apt-get -y install --no-install-recommends nano default-jre default-jdk lsb-release wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget http://apache.mirrors.hoobly.com/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz && \
    mkdir -p ${DRILL_HOME} && \
    tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz -C /usr/local && \
    mv /usr/local/apache-drill-${DRILL_VERSION}/* ${DRILL_HOME} && \
    rm -r /usr/local/apache-drill-${DRILL_VERSION} && \
    rm apache-drill-${DRILL_VERSION}.tar.gz && \
    chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]