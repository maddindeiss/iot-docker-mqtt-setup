FROM nodered/node-red:2.2.2-12

USER root
RUN adduser node-red dialout

USER node-red

RUN npm install \
    node-red-node-pi-gpiod \
    node-red-dashboard \
    node-red-contrib-influxdb \
    node-red-contrib-home-assistant-websocket \
