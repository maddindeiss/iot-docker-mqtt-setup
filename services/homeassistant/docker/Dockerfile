FROM ghcr.io/home-assistant/raspberrypi4-homeassistant:2024.11.3


# Set environment variables
ENV PATH=/usr/local/bin:$PATH

# Install dependencies
RUN apk add --no-cache git jq

# Create the Home Assistant configuration directory
RUN mkdir -p /config
# Set the working directory
WORKDIR /config

# Download and install HACS
RUN wget -O - https://get.hacs.xyz | bash -

# Clean up
RUN apk del git jq && rm -rf /var/cache/apk/*
