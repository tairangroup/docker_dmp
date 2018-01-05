FROM gudaoxuri/scala_2.11:latest
MAINTAINER gudaoxuri <i@sunisle.org>

# Setup env
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV KEEP false

RUN yum install -y which

# Download hadoop
RUN wget -q -O - http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz | tar -xzf - -C /opt/ \
 && mv /opt/hadoop-2.9.0 /opt/hadoop

RUN mkdir -p /data/hadoop/hdfs/nn \
 && mkdir -p /data/hadoop/hdfs/dn \
 && mkdir -p /data/hadoop/tmp

COPY core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
COPY hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml
COPY bootstrap_keep.sh /bin/bootstrap_keep.sh
COPY bootstrap_ssh.sh /bin/bootstrap_ssh.sh
COPY bootstrap_dfs.sh /bin/bootstrap_dfs.sh
COPY bootstrap.sh /bin/bootstrap.sh

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
 && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
 && chmod 0600 ~/.ssh/authorized_keys

EXPOSE 9000 50010 50020 50070 50075 50090

VOLUME ["/data/hadoop/hdfs/dn", "/data/hadoop/hdfs/nn"]

ENTRYPOINT /bin/bootstrap.sh $KEEP