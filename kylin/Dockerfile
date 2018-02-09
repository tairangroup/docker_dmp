FROM ztzjut/hive:latest AS hive_env
MAINTAINER ztzjut <i@sunisle.org>

FROM ztzjut/hbase:latest AS hbase_env

FROM ztzjut/spark:latest AS spark_env

COPY --from=hive_env /opt/hive /opt/hive
COPY --from=hive_env /bin/bootstrap_hive.sh /bin/bootstrap_hive.sh
COPY --from=hbase_env /opt/hbase /opt/hbase
COPY --from=hbase_env /opt/phoenix /opt/phoenix
COPY --from=hbase_env /bin/bootstrap_hbase.sh /bin/bootstrap_hbase.sh

ENV HIVE_HOME /opt/hive
ENV HBASE_HOME /opt/hbase
ENV KYLIN_HOME /opt/kylin
ENV PATH $HIVE_HOME/bin:$HBASE_HOME/bin:$KYLIN_HOME/bin:$PATH
ENV KEEP false

RUN echo "export HIVE_HOME=/opt/hive" >> /etc/profile \
 && echo "export HBASE_HOME=/opt/hbase" >> /etc/profile \
 && echo "export KYLIN_HOME=/opt/kylin" >> /etc/profile \
 && echo "export PATH=$HIVE_HOME/bin:$HBASE_HOME/bin:$KYLIN_HOME/bin:$PATH" >> /etc/profile


# copy kylin
RUN wget -q -O - http://mirrors.shu.edu.cn/apache/kylin/apache-kylin-2.2.0/apache-kylin-2.2.0-bin-hbase1x.tar.gz | tar -xzf - -C /opt/ \
 && mv /opt/apache-kylin-2.2.0-bin-hbase1x /opt/kylin

#COPY apache-kylin-2.2.0-bin-hbase1x.tar.gz /opt
#RUN tar -xzf /opt/apache-kylin-2.2.0-bin-hbase1x.tar.gz -C /opt/
#RUN ls /opt/
#RUN mv /opt/apache-kylin-2.2.0-bin /opt/kylin

RUN mkdir $KYLIN_HOME/hadoop-conf
RUN ln -s /opt/hadoop/etc/hadoop/core-site.xml $KYLIN_HOME/hadoop-conf/core-site.xml
RUN ln -s /opt/hadoop/etc/hadoop/hdfs-site.xml $KYLIN_HOME/hadoop-conf/hdfs-site.xml
RUN ln -s /opt/hadoop/etc/hadoop/yarn-site.xml $KYLIN_HOME/hadoop-conf/yarn-site.xml
RUN ln -s /opt/hbase/conf/hbase-site.xml $KYLIN_HOME/hadoop-conf/hbase-site.xml


RUN cp $HIVE_HOME/conf/hive-site.xml $SPARK_HOME/conf/ \
 && cp $HIVE_HOME/conf/hive-log4j2.properties $SPARK_HOME/conf/ \
 && cp $HIVE_HOME/lib/mysql-connector-java-5.1.45-bin.jar $SPARK_HOME/jars/

COPY find-hive-dependency.sh $KYLIN_HOME/bin/find-hive-dependency.sh
COPY kylin.properties $KYLIN_HOME/conf
COPY hive-site.xml $KYLIN_HOME/hadoop-conf/hive-site.xml
# docker tomcat bug
COPY server.xml $KYLIN_HOME/tomcat/conf/server.xml
COPY bootstrap_kylin.sh /bin/bootstrap_kylin.sh
COPY bootstrap.sh /bin/bootstrap.sh

RUN chmod +x /bin/bootstrap*

EXPOSE 7070 9092 8083 8082 8081 10000 60000 60010 60030

ENTRYPOINT /bin/bootstrap.sh $KEEP
