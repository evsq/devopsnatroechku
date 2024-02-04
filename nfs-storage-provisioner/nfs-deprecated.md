kubectl create nfs
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm -n nfs install nfs-server-provisioner stable/nfs-server-provisioner