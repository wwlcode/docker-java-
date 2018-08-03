FROM daocloud.io/shaoling/workspace-env-base:latest
MAINTAINER kfcoding-wwl

WORKDIR /usr/local/
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
RUN tar -zxvf  jdk-8u181-linux-x64.tar.gz
ADD apache-tomcat-9.0.10.tar.gz /usr/local/
ADD HelloWorld.java /HelloWorld.java
ADD run.sh /run.sh

ENV JAVA_HOME /usr/local/jdk1.8.0_181
ENV JRE_HOME /usr/local/jdk1.8.0_181/jre
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.10
ENV CATALINA_BASE /usr/local/apache-tomcat-9.0.10
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
WORKDIR /
RUN chmod +x /*.sh
RUN chmod +x /$CATALINA_HOME/bin/*.sh
CMD ["/run.sh"]
EXPOSE 80
EXPOSE 443
