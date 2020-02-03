FROM openjdk:8-jdk-alpine3.7

RUN addgroup -S ClientNotifier && adduser -S -G ClientNotifier ClientNotifier

#RUN mkdir /usr/src/drsContainer/

WORKDIR /usr/src/drsContainer

RUN mkdir /usr/share/ClientNotifier/ 
#COPY jobs/ClientNotifier/target/ClientNotifier-1.0-SNAPSHOT.jar /usr/share/ClientNotifier/ClientNotifier-1.0-SNAPSHOT.jar
COPY jobs/ClientNotifier/target/ClientNotifier-1.0-SNAPSHOT-full.jar /usr/share/ClientNotifier/ClientNotifier-1.0-SNAPSHOT-full.jar

#ADD  lib /usr/share/ClientNotifier/lib

RUN mkdir /usr/share/logs/
WORKDIR /usr/share
RUN chmod 775 logs

WORKDIR /usr/share/ClientNotifier


RUN chown -R ClientNotifier:ClientNotifier .
USER ClientNotifier

#CMD ["java", "-jar","ClientNotifier-1.0-SNAPSHOT.jar"]
CMD ["java", "-jar","ClientNotifier-1.0-SNAPSHOT-full.jar"]