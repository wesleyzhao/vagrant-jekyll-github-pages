# Vagrant Box with Jekyll/Github Pages

## Goal
Get a local Jekyll/Github Pages project running as fast as possible.

## Requirements
[Vagrant](https://vagrantup.com)  
[Virtualbox](https://virtualbox.com)

## Quickstart

Clone this repo and within the repo directory:

```
$ vagrant up && vagrant provision

```

__Optional but suggested__

Before the `vagrant up` command first set `JEKYLL_SITE_PATH` to point to your jekyll/github pages project. See below for details. 


## Usage

The quickstart `vagrant up` should do almost all the work for you to set up a working local environment for your github pages/jekyll site. 

In addition to the main installations, you may want to mirror your jekyll/github pages project from your host onto the vagrant box or actually run the `jekyll serve` command to start seeing your project at  [http://localhost:4000/](http://localhost:4000)

### Mirroring Your Jekyll Project Folder
IMO the best way to develop/test your project is to have the files on your host box and mirror that folder onto the vagrant box.

Set `JEKYLL_SITE_PATH` on your host and reload the vagrant box

```
$ export JEKYLL_SITE_PATH=/path/to/github-pages/project/
$ vagrant reload
```

### Serving Your Jekyll Site
Next, you'll want to actually serve the project pages and make them available to view on your browser.

While on your vagrant box, go into the Jekyll site folder (by default we set it to `/home/vagrant/site`)

```
$ vagrant ssh
$ cd /home/vagrant/site
$ bundle install
$ bundle exec jekyll serve --host 0.0.0.0
```

By default you can now go to [http://localhost:4000/](http://localhost:4000) to see your site


## Notes

This is a working MVP. It works. It will get a vagrant box running with jekyll and github-pages installed to easily get started with github pages. The different guides I used to put this together are here:

* [Installing RVM/ruby on Ubuntu](https://github.com/rvm/ubuntu_rvm)
* [Setting up your Github Pages Site Locally with Jekyll](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)
* [kappataumu/vagrant-up-github-pages project](https://github.com/kappataumu/vagrant-up-github-pages)

## TODO

* provisioning should not require re-provision
* Flag for either plain jekyll use versus github-pages
* Automatically pull/clone github-pages site
* Ansible provisioning option
