FROM tairangroup/spark:latest
MAINTAINER gudaoxuri <i@sunisle.org>

# Setup env
ENV LIVY_HOME /opt/livy
ENV PATH $PATH:$LIVY_HOME/bin
ENV KEEP false

RUN echo "export LIVY_HOME=/opt/livy" >> /etc/profile \
 && echo "export PATH=$LIVY_HOME/bin:$PATH" >> /etc/profile

# install unzip
RUN yum install -y unzip zip

# Download livy
RUN sudo su \
 && wget -q -O livy-0.5.0-incubating-bin.zip http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/livy/0.5.0-incubating/livy-0.5.0-incubating-bin.zip \
 && unzip /livy-0.5.0-incubating-bin.zip -d /opt/ \
 && mv /opt/livy-0.5.0-incubating-bin /opt/livy \
 && mkdir /opt/livy/logs \
 && cp $LIVY_HOME/conf/log4j.properties.template $LIVY_HOME/conf/log4j.properties \
 && cp $LIVY_HOME/conf/spark-blacklist.conf.template $LIVY_HOME/conf/spark-blacklist.conf

COPY hive-site.xml $LIVY_HOME/conf/
COPY livy.conf $LIVY_HOME/conf/
COPY bootstrap_livy.sh /bin/bootstrap_livy.sh
COPY bootstrap.sh /bin/bootstrap.sh

RUN chmod +x /bin/bootstrap*

EXPOSE 4040 7077 8998 18080 18081

ENTRYPOINT /bin/bootstrap.sh $KEEP
