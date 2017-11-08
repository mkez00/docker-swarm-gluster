
#!/bin/sh

# Install Grafana
docker pull grafana/grafana
ID="$(docker service create --replicas 1 --name grafana --mount type=bind,source=/mnt/glusterfs/var/lib/grafana,target=/var/lib/grafana grafana/grafana)"
docker service update --publish-add 3000:3000 $ID

# Install Prometheus
docker pull prom/prometheus
ID="$(docker service create --replicas 1 --name prometheus prom/prometheus)"
docker service update --publish-add 9090:9090 $ID