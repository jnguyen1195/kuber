#!/bin/bash
# 1. download kube-aws from https://github.com/kubernetes-incubator/kube-aws/releases/
#         wget https://github.com/kubernetes-incubator/kube-aws/releases/download/v0.9.10-rc.5/kube-aws-darwin-amd64.tar.gz
# 2. use for kms-key-arn, use 
#       aws kms --region=us-west-1 create-key --description="kube-aws assets" > aws.arn
# 3. See https://kubernetes-incubator.github.io/kube-aws/getting-started/ to know how to set up up the parameters
#      For --external-dns-name=kuber.myguru.net  <== enter the 3rd name with FQDN
#      Must create : S3 ,DNS , keypair name prior configuring with kube-aws
kube-aws destroy --force
kube-aws status 
rm -rf stack-templates  userdata kubeconfig cluster.yaml
kube-aws destroy --force
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
