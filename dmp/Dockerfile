FROM gudaoxuri/confluent:latest AS confluent_env
MAINTAINER gudaoxuri <i@sunisle.org>

FROM gudaoxuri/hive:latest AS hive_env

FROM gudaoxuri/hbase:latest AS hbase_env

FROM gudaoxuri/spark:latest AS spark_env

COPY --from=confluent_env /opt/confluent /opt/confluent
COPY --from=confluent_env /bin/bootstrap_confluent.sh /bin/bootstrap_confluent.sh
COPY --from=hive_env /opt/hive /opt/hive
COPY --from=hive_env /bin/bootstrap_hive.sh /bin/bootstrap_hive.sh
COPY --from=hbase_env /opt/hbase /opt/hbase
COPY --from=hbase_env /opt/phoenix /opt/phoenix
COPY --from=hbase_env /bin/bootstrap_hbase.sh /bin/bootstrap_hbase.sh

ENV CONFLUENT_HOME /opt/confluent
ENV HIVE_HOME /opt/hive
ENV HBASE_HOME /opt/hbase
ENV PATH $CONFLUENT_HOME/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$PATH
ENV KEEP false

RUN echo "export CONFLUENT_HOME=/opt/confluent" >> /etc/profile \
 && echo "export HIVE_HOME=/opt/hive" >> /etc/profile \
 && echo "export HBASE_HOME=/opt/hbase" >> /etc/profile \
 && echo "export PATH=$CONFLUENT_HOME/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$PATH" >> /etc/profile

RUN cp $HIVE_HOME/conf/hive-site.xml $SPARK_HOME/conf/ \
 && cp $HIVE_HOME/conf/hive-log4j2.properties $SPARK_HOME/conf/ \
 && cp $HIVE_HOME/lib/mysql-connector-java-5.1.45-bin.jar $SPARK_HOME/jars/

COPY bootstrap_all.sh /bin/bootstrap_all.sh
COPY bootstrap.sh /bin/bootstrap.sh

RUN chmod +x /bin/bootstrap*

EXPOSE 9092 8083 8082 8081 10000 60000 60010 60030

ENTRYPOINT /bin/bootstrap.sh $KEEP
