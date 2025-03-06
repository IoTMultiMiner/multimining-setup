#!/bin/bash
# Script to run Helium Gateway miner on Raspberry Pi using Docker
# Requires: Raspberry Pi with LoRa HAT (e.g., RAK2287) and i2c-5 device
# Image: quay.io/team-helium/miner:gateway-latest

docker run -d --privileged \
    --name miner \
    -e GW_KEYPAIR="ecc://i2c-5:96?slot=0" \
    -e GW_ONBOARDING="ecc://i2c-5:96?slot=15" \
    -e RUST_BACKTRACE=1 \
    -e GW_LISTEN=0.0.0.0:1680 \
    --network host \
    --restart unless-stopped \
    --device "/dev/i2c-5:/dev/i2c-5:rwm" \
    quay.io/team-helium/miner:gateway-latest \
    helium_gateway server
