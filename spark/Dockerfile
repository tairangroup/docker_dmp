FROM gudaoxuri/hdfs:latest
MAINTAINER gudaoxuri <i@sunisle.org>

#---------------Install Scala---------------
RUN wget -P /opt/env/ http://downloads.typesafe.com/scala/2.11.12/scala-2.11.12.tgz  && \
    tar -xzf /opt/env/scala-2.11.12.tgz -C /opt/env/  && \
    rm /opt/env/scala-2.11.12.tgz  && \
    mv /opt/env/scala-2.11.12 /opt/env/scala

RUN echo "export SCALA_HOME=/opt/env/scala" >> /etc/profile
RUN sed /^PATH=/d /etc/profile >> /etc/profile && \
   echo 'PATH=$PATH:$JAVA_HOME/bin:$SCALA_HOME/bin' >> /etc/profile

RUN echo "export SCALA_HOME=/opt/env/scala" >> /root/.bashrc

ENV SCALA_HOME /opt/env/scala
ENV PATH $PATH:$JAVA_HOME/bin:$SCALA_HOME/bin
#------------------------------

# Setup env
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:$SPARK_HOME/sbin
ENV KEEP false

# Download spark
RUN wget -q -O - http://mirrors.hust.edu.cn/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz | tar -xzf - -C /opt/ \
 && mv /opt/spark-2.2.1-bin-hadoop2.7 /opt/spark

RUN mkdir -p /data/spark/data \
 && mkdir -p /data/spark/logs

COPY spark-env.sh $SPARK_HOME/conf/
COPY bootstrap_spark.sh /bin/bootstrap_spark.sh
COPY bootstrap.sh /bin/bootstrap.sh

RUN cp $HIVE_HOME/conf/hive-site.xml $SPARK_HOME/conf/
 && cp $HIVE_HOME/conf/hive-log4j2.properties $SPARK_HOME/conf/

EXPOSE 4040 7070 8080 8081

ENTRYPOINT /bin/bootstrap.sh $KEEP
