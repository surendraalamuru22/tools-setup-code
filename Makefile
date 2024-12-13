infra:
      terraform init
      terraform apply -auto-approve

ansible:
       ansible-playbook -i 172.31.88.71, -e ansible_user=centos -e ansible_password=DevOps321 -e tool_name=${tool_name} -e vault_token=${vault_token} main.yml