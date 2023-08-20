# IoT Docker Setup with Node-Red, Mosquitto, Home Assistant, deCONZ, InfluxDB and Grafana

This Setup is using the official Docker Images of
* Node-Red ([DockerHub](https://hub.docker.com/r/nodered/node-red/))
* Mosquitto ([DockerHub](https://hub.docker.com/_/eclipse-mosquitto/))
* HomeAssistant ([DockerHub](https://hub.docker.com/r/homeassistant/home-assistant/))
* deCONZ ([DockerHub](https://hub.docker.com/r/deconzcommunity/deconz/))
* InfluxDB ([DockerHub](https://hub.docker.com/_/influxdb))
* Grafana ([DockerHub](https://hub.docker.com/r/grafana/grafana/))

## Install

You will need to install git first to checkout the repository or download manually

```
sudo apt install git
```

Checkout the repository with:

```
git clone git@github.com:maddindeiss/iot-docker-mqtt-setup.git 
```


## Run

#### Pre-requisite
Before running te setup for the deconz Docker container, you may need to add your Linux user to the dialout group, which allows the user access to serial devices (i.e. Conbee/Conbee II/RaspBee/RaspBeeII):
```
sudo usermod -a -G dialout $USER
```

Run the setup script first to create folder structure, set permissions and install all necessary packages

```
bash setup.sh
```

> To change the default passwords and other settings, have a look on the .env files in the docker folder.

To get the IOT Stack started, run 

```
docker-compose up -d
```

## Backup

```
rclone config
```

```
bash scripts/backup.sh
```


## Issues

#### Permission denied on docker commands

Got a ```permission denied``` error, when I try to run Docker commands like ```docker info``` or ```docker-compose up```
```
Server:
ERROR: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.24/info: dial unix /var/run/docker.sock: connect: permission denied
```

My user was already in the 'docker' group, so this was not the Problem.

I fixed the problem by changing the access permissions:
```
sudo chmod 666 /var/run/docker.sock
```

#### Error getting credentials on docker commands
I had the following error when I tried to start a docker container: 
```error getting credentials - err: exit status 1, out: 'Cannot autolaunch D-Bus without X11 $DISPLAY'```

By default, Docker looks for the native binary on each of the platforms; i.e., “osxkeychain” on macOS, “wincred” on windows, and “pass” on Linux. A special case is that on Linux, Docker will fall back to the “secretservice” binary if it cannot find the “pass” binary.

he simplest solution to fix the “Cannot autolaunch D-Bus without X11 $DISPLAY” error is to install pass.

```
sudo apt-get install pass gnupg2

# create a gpg2 key
gpg2 --gen-key

# create the password store using the gpg user id
pass init $gpg_id
```

#### Deconz error on startup

Error:
```
Fatal Python error: init_interp_main: can't initialize time
```

Solution: 

Update ```libseccomp2``` to ```>=2.5.4```

https://packages.debian.org/sid/armhf/libseccomp2/download

```
wget http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.5.4-1+b1_armhf.deb

sudo dpkg -i libseccomp2_2.5.4-1+b1_armhf.deb

```

## Software Packages / Links

* Deconz Firmware: https://deconz.dresden-elektronik.de/deconz-firmware/
* Deconz Firmware Changelog: https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/Firmware-Changelog
