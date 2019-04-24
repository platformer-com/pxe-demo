 kubectl run sample-app --image=nj93/sample-app --restart=Always --dry-run -o yaml > deployment.yml
 kubectl explain Deployment.spec.template.spec.containers.resources
 kubectl apply -f deployment.yml
 kubectl  port-forward  <pod-name> 3000:8080
 kubectl port-forward svc/<service-name> <any port on  host machine>:<service-port>
 
 
 ### versions of deployments
 kubectl get rs | grep sample-app
 ### rollback to the previous deployment config
 kubectl rollout undo deployment/sample-app

 kubectl rollout history deployment/sample-app
 kubectl rollout status deployment/sample-app
 kubectl rollout pause deployment/sample-app
 kubectl rollout resume deployment/sample-app
 kubectl rollout undo deployment/sample-app --to-revision=5


 kubectl expose deployment/sample-app --port=80 --target-port=8080 --dry-run -o yaml > service.yml

 ### dns default name
 <service-name>.<namespace>.svc.cluster.local


## configmaps
kubectl create cm env-config --from-literal=env=production --from-literal=version=1.0 --dry-run -o yaml > app-config.yaml
kubectl create cm file-cm --from-file=some-key-name=config/config.json --dry-run -o yaml > k8s/file-cm.yaml
kubectl create cm file-cm --from-file=some-key-name=config/config.json --from-literal=version=1.0 --dry-run -o yaml > k8s/file-cm.yaml
kubectl create cm env-cm --from-env-file=config/key-values.env  --dry-run -o yaml > k8s/env-cm.yaml



## secrets
kubectl create secret generic  env-secret --from-literal=env=production --from-literal=version=1.0 --dry-run -o yaml > app-secret.yaml
kubectl create secret tls cert-name --key key.pem --cert cert.pem