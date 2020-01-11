#!/bin/bash

sudo mkdir /etc/telegraf/

sudo cp /vagrant/telegraf.conf /etc/telegraf/telegraf.conf

curl -o telegraf.rpm https://dl.influxdata.com/telegraf/releases/telegraf-1.13.1-1.x86_64.rpm
sudo yum localinstall -y telegraf.rpm

sudo usermod -a -G docker telegraf

sudo systemctl start telegraf
