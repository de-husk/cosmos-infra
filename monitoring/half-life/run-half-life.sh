#!/bin/sh

sed -i -e s/\$DISCORD_WEBHOOK_ID/$DISCORD_WEBHOOK_ID/g -e s/\$DISCORD_WEBHOOK_TOKEN/$DISCORD_WEBHOOK_TOKEN/g /data/config.yaml

half-life monitor -f /data/config.yaml