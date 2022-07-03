FROM prom/prometheus:v2.36.2

WORKDIR /prometheus

COPY run-prom.sh ./run-prom.sh
COPY prometheus.yaml /etc/prometheus/prometheus.yml 

ENTRYPOINT ["./run-prom.sh"]
CMD []