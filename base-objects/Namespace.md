Namespace (Неймспейс) в Kubernetes - объект,  изолирующий ресурсы и большую часть объектов в кластере.

При создании кластера Kubernetes по умолчанию пользователю доступно 4 неймспейса:
- default
- kube-node-lease
- kube-public
- kube-system

Команды для работы в Kubernetes:

Посмотреть список неймспейсов
kubectl get namespace

Создать неймспейсы test и production
kubectl create ns test
kubectl create ns production

Запустить под с образом nginx в неймспейсе test
kubectl run nginx --image=nginx --namespace=test

Получить список подов в неймспейсе production
kubectl get pods --namespace=production