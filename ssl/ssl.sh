cp openssl.cnf.temp openssl.cnf
echo s/MASTER_IP/$(cat ../ip | sed -e 's/\./\\\./g')/g > pat.tmp
sed -i -f pat.tmp openssl.cnf
rm pat.tmp
openssl genrsa -out ca-key.pem 2048
openssl req -x509 -new -nodes -key ca-key.pem -days 10000 -out ca.pem -subj "/CN=kube-ca"
openssl genrsa -out apiserver-key.pem 2048
openssl req -new -key apiserver-key.pem -out apiserver.csr -subj "/CN=kube-apiserver" -config openssl.cnf
openssl x509 -req -in apiserver.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out apiserver.pem -days 365 -extensions v3_req -extfile openssl.cnf
sudo mkdir -p /etc/kubernetes/ssl/
sudo mv -t /etc/kubernetes/ssl/ ca.pem apiserver.pem apiserver-key.pem
#uncomment this if you want to set permission
#sudo chmod 600 /etc/kubernetes/ssl/apiserver-key.pem
sudo chown root:root /etc/kubernetes/ssl/apiserver-key.pem
