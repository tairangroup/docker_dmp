FROM gudaoxuri/hdfs:latest
MAINTAINER gudaoxuri <i@sunisle.org>

# Setup env
ENV CONFLUENT_HOME /opt/confluent
ENV PATH $CONFLUENT_HOME/bin:$PATH
ENV KEEP false

RUN echo "export CONFLUENT_HOME=/opt/confluent" >> /etc/profile \
 && echo "export PATH=$CONFLUENT_HOME/bin:$PATH" >> /etc/profile

# Download confluent
RUN wget -q -O - http://packages.confluent.io/archive/4.0/confluent-oss-4.0.0-2.11.tar.gz | tar -xzf - -C /opt/ \
 && mv /opt/confluent-4.0.0 /opt/confluent

COPY server.properties $CONFLUENT_HOME/etc/kafka/server.properties
COPY schema-registry.properties $CONFLUENT_HOME/etc/schema-registry/schema-registry.properties

COPY bootstrap_confluent.sh /bin/bootstrap_confluent.sh

EXPOSE 9092 8083 8082 8081

VOLUME ["$CONFLUENT_HOME/share/java"]

ENTRYPOINT /bin/bootstrap.sh $KEEP