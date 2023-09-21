FROM ghcr.io/graalvm/jdk-community:21.0.0

RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

RUN mkdir -p /opt/inside/script
RUN mkdir -p /opt/inside/application
RUN mkdir -p /opt/inside/logs

WORKDIR /opt/inside/application

COPY ./etc/Docker/start.sh /opt/inside/script/start.sh
COPY ./target/inside_cloudconfig.jar /opt/inside/application/inside_cloudconfig.jar

ENTRYPOINT sh /opt/inside/script/start.sh