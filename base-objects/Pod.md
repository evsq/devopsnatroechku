Pod (Под) - Минимальная вычислительная единица в Kubernetes для запуска приложений.
Под состоит из одного или нескольких контейнеров с общим сетевым пространством и возможностью использования общего хранилища.

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
```

Команда для создания пода из файла/интернета
kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml