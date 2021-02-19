FROM nodered/node-red:1.2.9-12-arm32v7

USER root
RUN adduser node-red dialout

USER node-red

RUN npm install \
    node-red-node-pi-gpiod \
    node-red-dashboard \
    node-red-contrib-influxdb \