#!/usr/bin/env bash


# if [ ! -d test0 ]; then
# 	cp -ap base/ test0/
# 	pushd test0/
# 	terraform init <<EOF
# 1
# EOF
# 	terraform workspace select test0 || terraform workspace new test0
# 	terraform workspace new test1
# 	terraform workspace new test2
# 	terraform workspace new test3
# 	terraform workspace new test4
# 	terraform workspace new test5
# 	terraform workspace new test6
# 	terraform workspace new test7
# 	terraform workspace new test8
# 	terraform workspace select test0
	
# 	popd
# fi



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
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		# terraform apply --auto-approve
		popd
	} &
done
wait
