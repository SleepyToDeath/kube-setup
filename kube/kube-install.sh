curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.5.4/bin/linux/amd64/kubelet
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.5.4/bin/linux/amd64/kubectl
chmod +x ./kubelet
chmod +x ./kubectl
sudo mv ./kubelet /usr/bin/
sudo mv ./kubectl /usr/bin/
cp kubelet.service.temp kubelet.service
echo s/MASTER_IP/$(cat ../ip | sed -e 's/\./\\\./g')/g > pat.tmp
sed -i -f pat.tmp kubelet.service
rm pat.tmp
sudo cp kubelet.service /etc/systemd/
sudo systemctl enable /etc/systemd/kubelet.service
sudo systemctl start /etc/systemd/kubelet.service
sleep 10
kubectl config set-cluster calico-cluster --server=https://$(cat ../ip) --certificate-authority=/etc/kubernetes/ssl/ca.pem
kubectl config set-credentials calico-admin --certificate-authority=/etc/kubernetes/ssl/ca.pem --client-key=/etc/kubernetes/ssl/apiserver-key.pem --client-certificate=/etc/kubernetes/ssl/apiserver.pem
