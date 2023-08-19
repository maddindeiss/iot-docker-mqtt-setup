FROM nodered/node-red:3.0.2-14

USER root
RUN adduser node-red dialout

USER node-red

RUN npm install \
    node-red-node-pi-gpiod \
    node-red-dashboard \
    node-red-contrib-influxdb \
    node-red-contrib-home-assistant-websocket \
