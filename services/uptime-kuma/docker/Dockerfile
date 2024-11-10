FROM louislam/uptime-kuma:1.23.15-debian

RUN apt update
RUN apt --yes install python3
RUN apt-get install python3-setuptools
RUN pip3 install --upgrade pip

# MQTT Support requires paho-mqtt (a version less then v2) to work (Date: 2024-10-18)
# https://github.com/louislam/uptime-kuma/issues/1227#issuecomment-2311447607
RUN pip3 install --no-cache-dir paho-mqtt==1.6.1
