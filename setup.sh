#!/bin/bash
cd ./ssl
./ssl.sh
cd ../calico
./calico.sh
cd ../kube
./kube-install.sh
