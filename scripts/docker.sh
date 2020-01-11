#!/bin/bash

sudo cp /vagrant/config/daemon.json /etc/docker/daemon.json

sudo systemctl restart docker
