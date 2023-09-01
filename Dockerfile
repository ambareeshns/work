FROM tomcat:jre8-temurin-focal
COPY /target/ROOT.war /usr/local/tomcat/webapps
EXPOSE 8080
