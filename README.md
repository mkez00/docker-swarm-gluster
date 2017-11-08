# Overview

Demonstrates provisioning a Docker Swarm cluster with 3 manager nodes and HA volumes shared across all nodes using Gluster and Docker bind mounts.

# Instructions

1) Run `vagrant up`
2) Run `sh /data/gluster-server.sh` on gluster1
3) Run `sh /data/gluster-client.sh` on manager1, worker1, worker2
4) Run `sh /data/docker-service-add.sh` on manager1

# Test

1) Go to `http://192.168.56.90:3000` or `http://192.168.56.91:3000` or `http://192.168.56.92:3000`
2) Create a Prometheus datasource in Grafana using URL: `http://172.17.0.1:9090` (`172.17.0.1` is the `docker0` interface on each node in the swarm)
3) From host machine execute: `vagrant halt manager1`
4) Go to: `http://192.168.56.91:3000` or `http://192.168.56.92:3000`.  Notice datasource is still persistent.
