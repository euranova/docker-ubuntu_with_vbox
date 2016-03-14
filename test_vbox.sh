#!/bin/bash

echo $(vboxmanage --version)
[[ "$(pwd)" = "/data" ]] && echo "Working directory is /data."
[[ -d "${VBOX_HOME_USER}" ]] && echo "VBOX HOME USER has been created."
[[ -d "${VAGRANT_HOME}" ]] && echo "VAGRANT HOME has been created."
vagrant init ubuntu/precise64
vagrant up --provider virtualbox
echo $(vagrant ssh -c "echo Hello") | grep Hello
vagrant halt
