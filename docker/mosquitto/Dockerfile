FROM eclipse-mosquitto:latest

ADD docker-entrypoint.sh /

ENTRYPOINT ["sh", "./docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/docker/mosquitto/mosquitto.conf"]
