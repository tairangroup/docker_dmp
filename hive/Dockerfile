FROM gudaoxuri/hdfs:latest
MAINTAINER gudaoxuri <i@sunisle.org>

# Setup env
ENV HIVE_HOME /opt/hive
ENV HIVE_CONF_DIR $HIVE_HOME/conf
ENV PATH $PATH:$HIVE_HOME/bin
ENV KEEP false

# Download hive
RUN wget -q -O - https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-2.3.2/apache-hive-2.3.2-bin.tar.gz | tar -xzf - -C /opt/ \
 && mv /opt/apache-hive-2.3.2-bin /opt/hive

RUN mkdir -p /data/spark/data \
 && mkdir -p /data/spark/logs

COPY mysql-connector-java-5.1.45-bin.jar $HIVE_HOME/lib
COPY hive-env.sh $HIVE_HOME/conf/
COPY hive-site.xml $HIVE_HOME/conf/
RUN  rename $HIVE_HOME/conf/hive-log4j2.properties.template $HIVE_HOME/conf/hive-log4j2.properties

COPY bootstrap_hive.sh /bin/bootstrap_hive.sh
COPY bootstrap.sh /bin/bootstrap.sh

EXPOSE 10000

ENTRYPOINT /bin/bootstrap.sh $KEEP
