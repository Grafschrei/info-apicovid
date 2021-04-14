From tomcat:8.0.51-jre8-alpine
EXPOSE 8080
RUN rm -rf /usr/local/tomcat/webapps/*
COPY info-covid-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh","run"]