cp calico-etcd.manifest.temp calico-etcd.manifest
cp network-environment.temp network-environment
echo s/MASTER_IP/$(cat ../ip | sed -e 's/\./\\\./g')/g > pat.tmp
sed -i -f pat.tmp calico-etcd.manifest
sed -i -f pat.tmp network-environment
rm pat.tmp
sudo cp calico-etcd.manifest /etc/kubernetes/manifests/
sudo cp network-environment /etc/
