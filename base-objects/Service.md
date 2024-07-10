Service (Сервис) - объект, предоставляющий сетевой доступ к одному или балансировку к нескольким Подам через доменное имя.

Представленный ниже сервис позволяет взаимодействовать с подом nginx через доменное имя nginx. Такая связанность достигается путем одинаковых значений `app: nginx` в selector у Service и labels у Pod.

```
apiVersion: v1
kind: Service
metadata:
  name: nginx
spec:
  type: ClusterIP
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
```

Команда для создания пода из файла/интернета
kubectl apply -f service-pod.yaml

В Kubernetes у объекта Service существует 5 типов работы.
type: ClusterIP - Делает приложение доступным по доменому имени внутри кластера
type: NodePort - Делает приложение доступным изнутри кластера (во внешней сети) через ip адрес воркер нод и nodeport в диапазоне 30000-32767
type: LoadBalancer - Делает приложение доступным изнутри кластера через внешний ip адрес. По умолчанию не работает в кластере. Работает в облачных кластерах или установленных реализаций например metalLb
type: ExternalName - Позволяет реализовать CNAME на любое DNS имя за пределами кластера, например сервис с названием my-service.prod.svc.cluster.local будет проксировать запрос на my.database.example.com
ClusterIP: None - Делает приложение доступным внутри кластера по имени пода. Не осуществляет балансировку, поэтому вам необходимо знать конечную точку адресата.