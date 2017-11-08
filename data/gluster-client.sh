#!/bin/sh

# configure gluster mount
mount -t glusterfs 192.168.56.81:/gvol0 /mnt/glusterfs
mkdir -p /mnt/glusterfs/var/lib/grafana