# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_version = "20181015.0.0"

  config.vm.network "forwarded_port", guest: 4000, host: 4000

  # JEKYLL_SITE_PATH should point to your jekyll/github-pages site
  if ENV['JEKYLL_SITE_PATH']
    config.vm.synced_folder ENV['JEKYLL_SITE_PATH'], "/home/vagrant/site/"
  end

  # TODO add ansible provisioning option
  config.vm.provision "shell", path: "provision.sh", privileged: false
end
