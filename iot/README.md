# IoT Docker Setup with Node-Red, Mosquitto, OpenHab, InfluxDB and Grafana

This Setup is using the official Docker Images of
* Node-Red ([DockerHub](https://hub.docker.com/r/nodered/node-red/))
* Mosquitto ([DockerHub](https://hub.docker.com/_/eclipse-mosquitto/))
* OpenHab ([DockerHub](https://hub.docker.com/r/openhab/openhab/))
* InfluxDB ([DockerHub](https://hub.docker.com/_/influxdb))
* Grafana ([DockerHub](https://hub.docker.com/r/grafana/grafana/))

## Install

You will need to install git first to checkout the repository or download manually

```
sudo apt install git
```

2.Checkout the repository with:

```
git clone git@github.com:maddindeiss/iot-docker-mqtt-setup.git 
```


#### To change the default passwords and other settings, there are .env files in the docker folder, for each iot service.

### Build and run

Run the setup script first to create folder structure, set permissions and install all necessary packages

```
. setup.sh
```

To get the IOT Stack started, run 

```
docker-compose up -d
```

## Backup

```
rclone config
```

```
. scripts/backup.sh
```


## Issues

I got a ```permission denied``` error, when I try to run Docker commands like ```docker info``` or ```docker-compose up```
```
Server:
ERROR: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.24/info: dial unix /var/run/docker.sock: connect: permission denied
```

My user was already in the 'docker' group, so this was not the Problem.

I fixed the problem by changing the access permissions:
```
sudo chmod 666 /var/run/docker.sock
```