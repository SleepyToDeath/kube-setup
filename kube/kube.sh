cp kubelet.service.temp kubelet.service
echo s/MASTER_IP/$(cat ../ip | sed -e 's/\./\\\./g')/g > pat.tmp
sed -i -f pat.tmp kubelet.service
rm pat.tmp
sudo cp kubelet.service /etc/systemd/
sudo systemctl daemon-reload
kubectl config set-cluster calico-cluster --server=https://$(cat ../ip) --certificate-authority=/etc/kubernetes/ssl/ca.pem
kubectl config set-credentials calico-admin --certificate-authority=/etc/kubernetes/ssl/ca.pem --client-key=/etc/kubernetes/ssl/apiserver-key.pem --client-certificate=/etc/kubernetes/ssl/apiserver.pem
