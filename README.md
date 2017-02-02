# vagrant-lxc-base-boxes-builder

Easily create [vagrant-lxc-base-boxes](https://github.com/obnoxxx/vagrant-lxc-base-boxes) in a Ubuntu 14.04 Vagrant VM instead of on your host machine, for usage with [vagrant-lxc](https://github.com/fgrehm/vagrant-lxc).

## Usage

```
$ git clone --recursive git@github.com:djvdorp/vagrant-lxc-base-boxes-builder.git
$ cd vagrant-lxc-base-boxes-builder
$ BOXES=wheezy,jessie,stretch vagrant up

wait for a while...

your requested boxes will be in workspace/output/ on your host machine

$ vagrant halt

next time you can use:
$ BOXES=wheezy,jessie,stretch vagrant provision
```
