FROM openjdk:8-jre-alpine

ARG RCON_PASSWORD=abc123

ARG REVISION=1.14.3

ENV RCON_PASSWORD=${RCON_PASSWORD}

RUN apk update \
  && apk add curl git wget

RUN curl "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -o BuildTools.jar

RUN java -jar BuildTools.jar --rev ${REVISION}

RUN echo 'eula=true' > eula.txt

RUN mkdir plugins

RUN cd plugins/ && wget https://media.forgecdn.net/files/2723/275/worldedit-bukkit-7.0.0.jar && wget https://media.forgecdn.net/files/2723/606/worldguard-bukkit-7.0.0.jar && cd ..

RUN echo 'enable-rcon=true' >> server.properties

RUN echo rcon.password=${RCON_PASSWORD} >> server.properties

CMD java -jar spigot-1.14.4.jar

