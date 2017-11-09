
#!/bin/sh

# Install Grafana
docker pull grafana/grafana
docker service create --replicas 1 --name grafana --mount type=bind,source=/mnt/glusterfs/var/lib/grafana,target=/var/lib/grafana --publish 3000:3000/tcp grafana/grafana

# Install Prometheus
docker pull prom/prometheus
docker service create --replicas 1 --name prometheus --publish 9090:9090/tcp prom/prometheus