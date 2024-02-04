kubectl create nfs

helm repo add stable https://charts.helm.sh/stable

helm repo update

helm -n nfs install nfs-server-provisioner stable/nfs-server-provisioner

если мы хотим поднять под и примонтировать pv - необходимо установить nfs-common на все воркер ноды

sudo apt-get install nfs-common -y
