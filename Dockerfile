FROM ubuntu as dude
RUN mkdir -p WAR-FILE
COPY /target/*.war /WAR-FILE/ROOT.war


FROM tomcat:jre8-temurin-focal
COPY --from=dude /WAR-FILE/ROOT.war /usr/local/tomcat/webapps
EXPOSE 8080
