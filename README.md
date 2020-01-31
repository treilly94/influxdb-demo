# influxdb-demo

This is a demo of a tick stack.

## Quick Start

Run `vagrant up` to start the vms (Note the provisioning should work automatically however in some cases it isnt run properly and the tick stack will be using default config. If that does happen try running `vagrant provision`)

When its all up go to http://10.10.10.10:8888

Go through the initial setup (The urls should use the ip address `10.10.10.10` not the default value of `localhost`).

## Project Structure

### Vagrant

There is a vagrant file that will start two vms, one to run the stack and one to make the metrics more interesting.

The Vagrant vms are provisioned with the docker and shell provisioners.

### Scripts

The `scripts` directory contains the shell scripts used by the vagrant provisioner

| Script        | Description                      |
| ------------- | -------------------------------- |
| telegraf.sh   | Installs and configures telegraf |
| syslog.sh     | Installs and configures syslog   |
| docker.sh     | Configures docker daemon         |

### Config

The `config` directory contains the config files for the various services. These are then either moved into the appropiate directory by one of the scripts or mounted into a docker container.


| Config             | Description                                                 |
| ------------------ | ----------------------------------------------------------- |
| daemon.json        | Configures docker logs to go to telegraf (Work in progress) |
| influxdb.conf      | Config for influxdb                                         |
| kapacitor.conf     | Config for kapacitor                                        |
| syslog.conf        | Configures vm syslog to go to telegraf                      |
| telegraf.conf      | General config for telegraf                                 |
| telegraf_tick.conf | Telegraf config for influx and kapacitor metrics            |

### Dashboards

These are just some dashboards I made. They can be manually impotred into capacitor after its all setup
