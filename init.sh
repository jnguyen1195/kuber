#!/bin/bash
# download kube-aws from https://github.com/kubernetes-incubator/kube-aws/releases/
# wget https://github.com/kubernetes-incubator/kube-aws/releases/download/v0.9.10-rc.5/kube-aws-darwin-amd64.tar.gz
# use for kms-key-arn
# aws kms --region=us-west-1 create-key --description="kube-aws assets" > aws.arn

kube-aws destroy --force
kube-aws status 
rm -rf stack-templates  userdata kubeconfig
rm cluster.yaml
kube-aws init --cluster-name=mykubercluster \
	 --s3-uri=s3://mys3kuber/mydir \
	 --external-dns-name=kuber.myguru.net \
	 --region=us-west-1 \
	 --availability-zone=us-west-1b \
	 --key-name=mykuberkey \
	 --hosted-zone-id=Z3TGWPAZ48CIQK\
	 --kms-key-arn="arn:aws:kms:us-west-1:235752450010:key/513d81ba-fcb6-4090-b59f-078c4400daac"
kube-aws render stack
kube-aws validate
kube-aws up
