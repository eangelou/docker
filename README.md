# docker
A small docker testing repo.

## Kubernetes
Try to setup a small sshd container on a cluster using kubectl and eangelou.yaml:
'''
kubectl create -f eangelou.yaml
ssh -p 30022 root@HOST
'''

For the time being, there is no automatic HAproxy config assumed on the cluster.

## kubectl
To configure kubectl to access the cluster from any machine, try creating an appropriate file in ~/.kube/config:
'''
apiVersion: v1
clusters:
- cluster:
    server: http://MyMaster:8080
  name: master
contexts:
- context:
    cluster: master
    user: ""
  name: masters
current-context: masters
kind: Config
preferences: {}
users: []
'''
