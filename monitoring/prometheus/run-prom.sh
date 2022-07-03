#!/bin/sh

# TODO: Generalize this akash config pattern into a utility that I can use each time

sed -i -e s/\$GRAFANA_CLOUD_ID/$GRAFANA_CLOUD_ID/g \
       -e s/\$GRAFANA_CLOUD_PASSWORD/$GRAFANA_CLOUD_PASSWORD/g \
       -e s/\$GRAFANA_CLOUD_URL/$GRAFANA_CLOUD_URL/g \
       -e s/\$PROM_ENDPOINTS/$PROM_ENDPOINTS/g \
       /etc/prometheus/prometheus.yml

prometheus --config.file=/etc/prometheus/prometheus.yml