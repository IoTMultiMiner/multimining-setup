#!/bin/bash
echo "Starting LoRaWAN gateway for multi-mining..."
docker run -d --name crankk chirpstack/chirpstack-gateway-bridge
echo "Gateway started. Monitoring logs..."
docker logs -f crankk
