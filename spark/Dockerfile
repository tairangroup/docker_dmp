FROM gudaoxuri/hdfs:latest
MAINTAINER gudaoxuri <i@sunisle.org>

# Setup env
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:$SPARK_HOME
ENV KEEP false

# Download spark
RUN wget -q -O - http://mirrors.hust.edu.cn/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz | tar -xzf - -C /opt/ \
 && mv /opt/spark-2.2.1-bin-hadoop2.7 /opt/spark

RUN mkdir -p /data/spark/data \
 && mkdir -p /data/spark/logs

COPY spark-env.sh /opt/hadoop/spark/conf/
COPY bootstrap_spark.sh /bin/bootstrap_spark.sh
COPY bootstrap.sh /bin/bootstrap.sh

EXPOSE 4040 7070 8080 8081

ENTRYPOINT /bin/bootstrap.sh $KEEP
