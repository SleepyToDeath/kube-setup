### What's this?
This is a set of bash scripts and config file that I used to setup a custumized kubernetes cluster.
I recommand you using minikube or follow other solutions in kubernetes's website if you don't 
have special requirement. This is only for thoes who has to setup a custumized kubernetes cluster,
especially in bare-matel environment(it should also work in virtual machines, though), for some reason.

It works on amd64 linux system. Kubernetes version is v1.5.4; Calico(for overlay network) version is v1.0.2

Run it on the master machine. It will setup the master services. For worker nodes, currently
it only setup the master machine as the first worker node. Scripts for other worker nodes may
(or may not :-P) come soon.

(not sure if the setup script works... I myself only used the reset one. It's great if anyone could
provide some feed back `_(:з」∠)_` )

### To install kubernetes for the first time:
1. install docker from any source you like, and start it
2. get this machine's IP and fill it in the file ./ip
3. run setup.sh
4. wait a few seconds

This does three things:
1. start the services of the master
2. connect the command line management tool kubectl to the master
3. set current machine as the first working node and connect it to the master

To check if it works:
1. run `docker ps`, if you see containers with name "api server", "scheduler", etc.,
then kubernetes master is successfully setup
2. run `kubectl get pods`, if you get meaningful result(or "no resources"), 
then kubectl is successfully connected to the master. If it complains the ip of 
master is incorrect, then it failed to connect to the master.
3. run `kubectl get nodes`, if you see a node, then this machine is successfully setup
as a worker node. If you see no resources, then this setup has failed.

### Whenever the machine reboots
If the ip does not change, then no need to do anything

### Whenever the machine's ip changes:
1. get this machine's IP and fill it in the file ./ip
2. run reset.sh
3. wait a few seconds
4. (optional) reboot

