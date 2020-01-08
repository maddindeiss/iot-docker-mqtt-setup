# IoT Docker Setup with Node-Red, Mosquitto, OpenHab, InfluxDB and Grafana

This Setup is using the official Docker Images of
* Node-Red ([DockerHub](https://hub.docker.com/r/nodered/node-red/))
* Mosquitto ([DockerHub](https://hub.docker.com/_/eclipse-mosquitto/))
* OpenHab ([DockerHub](https://hub.docker.com/r/openhab/openhab/))
* InfluxDB ([DockerHub](https://hub.docker.com/_/influxdb))
* Grafana ([DockerHub](https://hub.docker.com/r/grafana/grafana/))

## Usage

Use the `.env` file to place the Mosquitto credentials and your User/Group Id for OpenHab

```
MOSQUITTO_USERNAME=mosquitto
MOSQUITTO_PASSWORD=mosquitto

OPENHAB_USER_ID=1000
OPENHAB_GROUP_ID=1000
```

### Build and run

```
docker-compose build
docker-compose up -d
```

## Folder Permissions

#### Grafana
```
sudo chown -R 472:472 grafana/data/ 
```

More information: https://grafana.com/docs/installation/docker/#user-id-changes

#### Mosquitto
```
sudo chown -R 1883:1883 mosquitto/data/ 
sudo chown -R 1883:1883 mosquitto/log/ 
```

## Info
