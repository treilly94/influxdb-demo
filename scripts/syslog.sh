#!/bin/bash

sudo yum -y install rsyslog

sudo cp /vagrant/config/syslog.conf /etc/rsyslog.d/50-telegraf.conf

sudo systemctl restart rsyslog.service
