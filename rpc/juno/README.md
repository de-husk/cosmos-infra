# Akash Juno RPCs

Deploys: 
 * Juno RPC nodes
 * Public Nginx proxy fronting the RPC nodes
 * Prometheus Metrics Exporter (for the juno node metrics and cloudflare metrics)

If you dont want to use prometheus / cloudflare then remove the prom scrapers.

## Deploy Steps
* cp deploy.example.yaml deploy.yaml
* edit `deploy.yaml` with your grafana cloud creds and myhost.com with your domain
* Deploy `deploy.yaml` on akash


## Grafana Cloud Setup

### Dashboards
* [Cosmos RPC Node Grafana Dashboard](https://grafana.com/grafana/dashboards/16529)
* [Cloudflare Grafana Dashboard](https://grafana.com/grafana/dashboards/13133) (NOTE: Really only useful if you have a non-free cloudflare account, but even the cheapest plan works well)