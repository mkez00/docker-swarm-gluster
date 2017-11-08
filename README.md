# Overview

Demonstrate a HA Docker Swarm cluster with HA volumes shared across all nodes using Gluster and Docker bind mounts.

# Instructions

1) Run `vagrant up`
2) Create Gluster directory on gluster2: `mkdir -p /gluster/gvol0`
3) Run `data/gluster-server.sh` on gluster1
4) Run `data/gluster-client.sh` on manager1, worker1, worker2
5) Run `data/docker-service-add.sh` on manager1

# Test

1) Go to `http://192.168.56.90:3000` or `http://192.168.56.91:3000` or `http://192.168.56.92:3000`
2) Create a datasource in Grafana
3) From host machine execute: `vagrant halt manager1`
4) Go to: `http://192.168.56.91:3000` or `http://192.168.56.92:3000`.  Notice datasource is still persistent.
