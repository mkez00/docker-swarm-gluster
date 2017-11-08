#!/bin/sh
mkdir -p /gluster/gvol0
gluster volume create gvol0 replica 2 192.168.56.81:/gluster/gvol0 192.168.56.82:/gluster/gvol0 force
gluster volume start gvol0