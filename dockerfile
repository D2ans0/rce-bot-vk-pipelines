FROM adoptopenjdk/openjdk8:alpine-jre

WORKDIR /app/

ARG JAR_FILE=RceBot-*-*.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT java \
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
-jar app.jar --config /app/config/bot.ini ${LAUNCH_ARGS}
