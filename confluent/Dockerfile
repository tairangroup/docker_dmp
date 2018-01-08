FROM gudaoxuri/hdfs:latest
MAINTAINER gudaoxuri <i@sunisle.org>

# Setup env
ENV CONFLUENT_HOME /opt/confluent
ENV PATH $PATH:$CONFLUENT_HOME/bin
ENV KEEP false

# Download confluent
RUN wget -q -O - http://packages.confluent.io/archive/4.0/confluent-oss-4.0.0-2.11.tar.gz | tar -xzf - -C /opt/ \
 && mv /opt/confluent-oss-4.0.0-2.11 /opt/confluent

EXPOSE 9092 9021 8083 8082 8081 2181

VOLUME ["$CONFLUENT_HOME/share/java"]

ENTRYPOINT /bin/bootstrap.sh $KEEP