FROM openjdk:8-jre-slim

ARG shared_workspace=/opt/workspace
ARG spark_version=3.0.0
ARG hadoop_version=2.7

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \
    apt-get install -y curl && \
    apt-get install -y unzip && \
    apt-get install -y wget && \
    curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

WORKDIR ${SPARK_HOME}

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.24.zip && \
    unzip mysql-connector-java-8.0.24.zip && \
    bin/spark-submit --jars ./mysql-connector-java-8.0.24/mysql-connector-java-8.0.24.jar

ARG spark_master_web_ui=8080

EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out