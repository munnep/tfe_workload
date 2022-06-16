#!/usr/bin/env bash

for i in {0..8}; do

	if [ ! -d test${i} ]; then
		cp -ap base/ test${i}/
		pushd test${i}
		terraform init <<EOF
${i}
EOF
		terraform workspace select test${i} || terraform workspace new test${i}
		popd
	fi

	{
		pushd test${i}
		terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		popd
	} &
done
wait
