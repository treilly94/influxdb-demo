#!/bin/bash

sudo cp /vagrant/config/telegraf.conf /etc/telegraf/telegraf.conf

if [ $HOSTNAME = "influxdb" ]
then
	sudo cp /vagrant/config/telegraf_tick.conf /etc/telegraf/telegraf.d/telegraf_tick.conf
fi

curl -o telegraf.rpm https://dl.influxdata.com/telegraf/releases/telegraf-1.13.1-1.x86_64.rpm
sudo yum localinstall -y telegraf.rpm

sudo usermod -a -G docker telegraf

sudo systemctl restart telegraf
