#!/bin/bash
kube-aws init --cluster-name=mykubercluster \
	 --s3-uri=s3://mykuber/mydir \
	 --external-dns-name=mykuberDNS \
	 --region=us-west-1 \
	 --availability-zone=us-west-1a \
	 --key-name=mykuberkey \
	 --hosted-zone-id=mykuberzone \
	 --kms-key-arn="arn:aws:kms:us-west-1:AKIAJEI4JKL5HT2MFQ7Q:key/MlYCnNIhGFw1+GV31Llrmk6ZH7Vnxse5sbBXTEUX"
