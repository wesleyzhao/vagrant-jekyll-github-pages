#!/usr/bin/env bash
RVM_VERSION=1.29.4-1
RUBY_VERSION=2.5.1
BUNDLER_VERSION=1.16.6
PAGES_VERSION=192

# Install ruby 2.5.1 via rvm 
# Guide: https://github.com/rvm/ubuntu_rvm

if ! dpkg -s rvm; then
# Conditional for now so when vagrant provision is run again we skip
# unecessary steps and save time
# TODO make this unecessary
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get update
  sudo apt-get install -y rvm=$RVM_VERSION git
 
  # add vagrant user to rvm group
  sudo usermod -a -G rvm vagrant

  # proper rvm install requires logout/login to reload group permissions
  # TODO get rid of this crappy logout
  exit
fi

# make rvm usable
source /etc/profile.d/rvm.sh

# REQUIRES RESTART
# logout
echo $USER
echo here
sudo su -l $USER
echo here2
rvm install $RUBY_VERSION --default


# Install bundler and githup-pages
# Guide: https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/
gem install bundler -v $BUNDLER_VERSION

# TODO allow installation of jekyll only vs github-pages
# gem install jekyll -v 3.8.4
gem install github-pages -v $PAGES_VERSION

# TODO start serving from existing jekyll project
# JEKYLL_SITE_PATH=/home/vagrant/site
# cd JEKYLL_SITE_PATH && bundle install
# cd JEKYLL_SITE_PATH && bundle exec jekyll serve --host 0.0.0.0