Deployment (Деплоймент) - объект, позволяющий обновлять, например, новую версию Подов без downtime, выбирать количество идентичных реплик приложения и гарантировать в запущенном состояние, то количество, которое указано в ключе replicas.

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
```

Команда для создания деплоймента из файла/интернета
kubectl apply -f