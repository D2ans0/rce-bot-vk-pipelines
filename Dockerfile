### Build stage ###
FROM maven:3.8.6-eclipse-temurin-8 as rce_bot_build
COPY src /build/src
COPY pom.xml /build
RUN mvn -f /build/pom.xml clean -B package -DskipTests -Dmaven.test.skip=true


### Package stage ###
FROM adoptopenjdk/openjdk8:alpine-jre

WORKDIR /app/

ARG JAR_FILE=RceBot-*-*.jar

ENV JMX_ACCESS_FILE=/app/config/jmxremote.access
ENV JMX_PASSWORD_FILE=/app/config/jmxremote.password
ENV JMX_PORT=9010
ENV JMX_HOST=0.0.0.0

COPY --from=rce_bot_build /build/target/RceBot-*-*.jar app.jar

# Set config permissions and start app
ENTRYPOINT \
    chmod 600 /app/config -R; \
    java \
    -Dsun.management.jmxremote.handlers=java.util.logging.ConsoleHandler \
    -Dcom.sun.management.jmxremote.local.only=false \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.authenticate=true \
    -Dcom.sun.management.jmxremote.access.file=${JMX_ACCESS_FILE} \
    -Dcom.sun.management.jmxremote.password.file=${JMX_PASSWORD_FILE} \
    -Dcom.sun.management.jmxremote.port=${JMX_PORT} \
    -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT} \
    -Dcom.sun.management.jmxremote.host=${JMX_HOST} \
    -Djava.rmi.server.hostname=${JMX_HOST} \
    -jar app.jar \
    --config /app/config/bot.ini ${LAUNCH_ARGS} \
