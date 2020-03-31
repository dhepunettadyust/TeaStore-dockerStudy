FROM maven:3.6-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY TeaStore-dockerStudy /tmp/
WORKDIR /tmp/
#COPY .m2 /root/.m2
RUN mvn clean install -DskipTests
 
FROM tomcat:9.0-jdk13-openjdk-buster
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY manager.context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY host-manager.context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/conf/context.xml
COPY mysql-connector-java-5.1.44-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.44-bin.jar
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.registry/target/tools.descartes.teastore.registry.war $CATALINA_HOME/webapps/tools.descartes.teastore.registry.war
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.webui/target/tools.descartes.teastore.webui.war $CATALINA_HOME/webapps/tools.descartes.teastore.webui.war
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.auth/target/tools.descartes.teastore.auth.war $CATALINA_HOME/webapps/tools.descartes.teastore.auth.war
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.image/target/tools.descartes.teastore.image.war $CATALINA_HOME/webapps/tools.descartes.teastore.image.war
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.recommender/target/tools.descartes.teastore.recommender.war $CATALINA_HOME/webapps/tools.descartes.teastore.recommender.war
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.persistence/target/tools.descartes.teastore.persistence.war $CATALINA_HOME/webapps/tools.descartes.teastore.persistence.war
