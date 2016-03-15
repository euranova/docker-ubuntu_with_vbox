FROM ubuntu:15.10
MAINTAINER toch

# Install a few requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    lsb-release \
    module-init-tools \
    openssh-client \
    wget

# Install VirtualBox
RUN echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list
RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
RUN apt-get update && apt-get install -y --no-install-recommends \
  virtualbox-5.0

# Install Vagrant
RUN wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb \
  && dpkg -i vagrant_1.8.1_x86_64.deb

# Setup the VirtualBox home directory
ENV DATA_DIR="/data"
ENV VBOX_USER_HOME="${DATA_DIR}/VirtualBox VMs"
ENV VAGRANT_HOME="${DATA_DIR}/vagrant.d"

RUN test ! -f "${DATA_DIR}" -a ! -d "${DATA_DIR}" \
    && mkdir -p "${DATA_DIR}"

# Working
WORKDIR "${DATA_DIR}"
