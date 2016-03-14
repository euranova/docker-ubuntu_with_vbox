# Docker image Ubuntu with VirtualBox

A Docker image of Ubuntu with VirtualBox. It's built on top of the Docker
image `ubuntu:15.10`. It has also Vagrant.

Versions:

* Ubuntu: 15.10
* VirtualBox: 5.0
* Vagrant: 1.8.1

## Host Requirement

Your host should have VirtualBox kernel modules installed and loaded. Of course,
it should also support virtualization. The version of the kernel modules should
be the same than the ones installed into the guest.

```
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
aptitude update; aptitude install virtualbox-5.0
```

## Usage

You can mount a specific host dir `host_data_dir` to the docker container `/data` dir. This directory will store the Vagrant boxes and VirtualBox Virtual Machines.

```bash
$ docker build -t enx/ubuntu-vbox .
$ docker run --device=/dev/vboxdrv --volume=/host_data_dir:/data enx/ubuntu-vbox
```
