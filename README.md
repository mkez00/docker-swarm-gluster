# Overview

# Instructions

1) Run `vagrant up`
2) Create Gluster directory on gluster2: `mkdir -p /gluster/gvol0`
3) Run `data/gluster-server.sh` on gluster1
4) Run `data/gluster-client.sh` on manager1, worker1, worker2
5) Run `data/docker-service-add.sh` on manager1