Vagrant.configure("2") do |config|

  # General
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  # Influx server
  config.vm.define "influxdb" do |influxdb|
    influxdb.vm.box = "centos/7"
    influxdb.vm.network "private_network", ip: "10.10.10.10"
    influxdb.vm.hostname = "influxdb"

    influxdb.vm.provider "virtualbox" do |vb|
      vb.name = "influxdb"
    end

    influxdb.vm.provision "docker" do |d|
      d.run "influxdb",
        args: "-p 8086:8086 -v /vagrant/config/influxdb.conf:/etc/influxdb/influxdb.conf:ro"

      d.run "chronograf",
        args: "-p 8888:8888"

      d.run "kapacitor",
        args: "-p 9092:9092 -v /vagrant/config/kapacitor.conf:/etc/kapacitor/kapacitor.conf:ro"

    end

    influxdb.vm.provision "shell", path: "scripts/docker.sh"

    influxdb.vm.provision "shell", path: "scripts/syslog.sh"

    influxdb.vm.provision "shell", path: "scripts/telegraf.sh"

  end

  # Rand
  config.vm.define "rand" do |rand|
    rand.vm.box = "centos/7"
    rand.vm.network "private_network", ip: "10.10.10.11"
    rand.vm.hostname = "rand"

    rand.vm.provider "virtualbox" do |vb|
      vb.name = "rand"
    end

    rand.vm.provision "docker" do |d|
      d.run "nginx"

    end

    rand.vm.provision "shell", path: "scripts/docker.sh"

    rand.vm.provision "shell", path: "scripts/syslog.sh"

    rand.vm.provision "shell", path: "scripts/telegraf.sh"
  
  end
  
end
