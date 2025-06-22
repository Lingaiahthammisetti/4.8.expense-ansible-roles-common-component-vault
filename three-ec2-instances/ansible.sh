#!/bin/bash
dnf install ansible -y
cd /tmp
git clone https://github.com/Lingaiahthammisetti/4.8.expense-ansible-roles-common-component-vault.git
cd 4.8.expense-ansible-roles-common-component-vault

# Store Ansible Vault password securely
echo 'admin1234' > /etc/ansible/.vault_pass.txt
chmod 600 /etc/ansible/.vault_pass.txt

# Run playbook using vault file
ansible-playbook db.yaml --vault-password-file /etc/ansible/.vault_pass.txt

ansible-playbook main.yaml -e component=db --vault-password-file /etc/ansible/.vault_pass.txt
ansible-playbook main.yaml -e component=db --vault-password-file /etc/ansible/.vault_pass.txt
ansible-playbook main.yaml -e component=backend --vault-password-file /etc/ansible/.vault_pass.txt
ansible-playbook main.yaml -e component=frontend --vault-password-file /etc/ansible/.vault_pass.txt