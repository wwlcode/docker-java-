FROM ubuntu:16.04
MAINTAINER kfcoding-wwl

ADD jdk-8u181-linux-x64.tar.gz /usr/local/
ADD apache-tomcat-9.0.10.tar.gz /usr/local/
ADD HelloWorld.java /HelloWorld.java
ADD run.sh /run.sh

ENV JAVA_HOME /usr/local/jdk1.8.0_181
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.10
ENV CATALINA_BASE /usr/local/apache-tomcat-9.0.10
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

RUN chmod +x /*.sh
RUN chmod +x /$CATALINA_HOME/bin/*.sh
CMD ["/run.sh"]
EXPOSE 80
EXPOSE 443
