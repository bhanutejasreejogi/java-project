FROM eclipse-temurin:17-jdk-jammy

ENV TOMCAT_VERSION=9.0.89

RUN apt-get update && \
    apt-get install -y curl && \
    curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

RUN rm -rf /opt/tomcat/webapps/*

COPY target/onlinebookstore.war /opt/tomcat/webapps/ROOT.war
COPY mariadb-java-client-3.3.3.jar /opt/tomcat/lib/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
