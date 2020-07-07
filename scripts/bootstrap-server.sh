#!/bin/sh

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

sudo chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

# vim ~/.kube/config

curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator

chmod +x ./aws-iam-authenticator

sudo mv aws-iam-authenticator /usr/local/bin

aws-iam-authenticator version

# vim ~/.aws/credentials

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh

chmod 700 get_helm.sh

./get_helm.sh


# HOW TO INSTALL LOKI-GRAFANA STACK USING HELM3 ON EKS
# helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# helm repo add loki https://grafana.github.io/loki/charts
# helm repo update
# kubectl create namespace loki-stack
# helm upgrade --install loki --namespace=loki-stack loki/loki-stack
# helm upgrade --install grafana --namespace=loki-stack stable/grafana
# kubectl edit svc -n loki-stack grafana ; CHANGE ClusterIP to NodePort
# ADD IN THE SECURITY GROUP OF WORKED NODES THE PORT OF THIS NodePort
# OBTAIN THE GRAFANA PASSWD FROM THE CMD BELOW. THE USERNAME IS ALWAYS admin.
# kubectl get secret --namespace <YOUR-NAMESPACE> loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
# kubectl get secret --namespace loki-stack grafana -o jsonpath="{.data.admin-password}" | base64 --decode
# GO TO ADD DATA FROM GRAFANA'S UI AND ADD LOKI:
# http://loki:3100
# THEN GO TO EXPLORE AND CHOOSE YOUR METRICS!
# ADD PROMETHEUS:
# helm install prometheus stable/prometheus -n loki-stack
# kubectl get svc -n loki-stack ; AND FIND THE prometheus-server internal IP
# THEN FROM GRAFANA UI, ADD AGAIN A NEW DATASOURCE, CHOOSE PROMETHEUS AND PASTER http://<prometheus-server-ip>
# CLICK SAVE AND TEST
# TO INSTALL ELK_STACK 
# helm install elk stable/elastic-stack
# THE ABOVE HELM CHART THROWS AN ERROR BETWEEN LOGSTASH AND ES SERVER, THE FOLLOWING IS WORKING OK
# helm repo add gitlab https://charts.gitlab.io/
# helm install elk gitlab/elastic-stack --version 3.0.0
# THOOUGH IT'S USING FILEBEAT INSTEAD LOGSTASH











