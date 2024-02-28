# создать отдельный namespace
kubectl create ns nfs

# добавить репо и обновить
helm repo add test-nfs-server-provisioner https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/

helm repo update

# скачать чарт
helm pull test-nfs-server-provisioner/nfs-server-provisioner --untar

# изменить значения в values.yaml
```
persistence:
  enabled: true
  storageClass: "-"
  size: 10Gi

storageClass:
  defaultClass: true

nodeSelector:
  kubernetes.io/hostname: {node-name}
```

# создать PV (файл лежит в папке рядом с этой инструкцией)
kubectl -n nfs apply -f pv.yaml

# установка
helm -n nfs upgrade --install nfs-server-provisioner test-nfs-server-provisioner/nfs-server-provisioner

# создать PVC и примонтировать к Pod (файлы лежат в папке рядом с этой инструкцией)
kubectl -n nfs apply -f pvc.yaml
kubectl -n nfs apply -f pod.yaml
