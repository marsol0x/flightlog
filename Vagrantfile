# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "flightlog"
  config.vm.box_url = "https://www.dropbox.com/s/0yd23dwyafnpp24/flightlog.box"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "manifests/modules"
  end

  config.vm.network :forwarded_port, guest: 4567, host: 4567
end
