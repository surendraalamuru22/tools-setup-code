infra:
	terraform init
	terraform apply -auto-approve

ansible:
	ansible-playbook -i $(tool_name)-internal.surendraalamuru22.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name) -e vault_token=$(vault_token) main.yml

logstash:
	ansible-playbook -i elasticsearch-internal.rdevopsb81.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=elasticsearch -e vault_token=$(vault_token) main.yml -t logstash

elasticsearch:
	ansible-playbook -i elasticsearch-internal.rdevopsb81.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=elasticsearch -e vault_token=$(vault_token) main.yml -t elk
