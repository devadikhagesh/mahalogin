FROM ubuntu:20.04
RUN apt-get update
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN apt install curl -y 
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar -xzvf apache*.tar.gz
RUN apt-get install openjdk-8-jdk -y
RUN java -version
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
COPY /home/ubuntu/workspace/docker-container/target/mahaLogin-2.0.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]
