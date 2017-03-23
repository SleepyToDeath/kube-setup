### To install kubernetes for the first time:
1. install docker from any source you like, and start it
2. get this machine's IP and fill it in the file ./ip
3. run setup.sh
4. wait a few seconds

This does three things:
1. start the services of the master
2. connect the command line management tool kubectl to the master
3. set current machine as the first working node and connect it to the master

To check if you have succeeded, 
1. run `docker ps`, if you see containers with name "api server", "scheduler", etc.,
then kubernetes master is successfully setup
2. run `kubectl get pods`, if you get meaningful result, then kubectl is successfully
connected to the master. If it complains the ip of master is incorrect, then it failed
to connect to the master.
3. run `kubectl get nodes`, if you see a node, then this machine is successfully setup
as a worker node, too. If you see no such resource, then this setup has failed.

### Whenever the machine reboots
If the ip does not change, then no need to do anything

### Whenever the machine's ip changes:
1. get this machine's IP and fill it in the file ./ip
2. run reset.sh
3. wait a few seconds
4. (optional) reboot

