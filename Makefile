ansible:
    ansible-playbook -i 172.31.89.193, ansible_user=centos ansible_password=DevOps321 -e tool_name=${tool_name} -e vault_token=${vault_token} main.yml