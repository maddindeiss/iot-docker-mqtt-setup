FROM nodered/node-red:4.0.5-22

USER root
RUN adduser node-red dialout

# RUN mkdir -p /data && chown -R node-red:node-red /data

USER node-red

RUN npm install \
    node-red-node-pi-gpiod \
    node-red-dashboard \
    node-red-contrib-influxdb \
    node-red-contrib-knx-ultimate \
    node-red-contrib-home-assistant-websocket
