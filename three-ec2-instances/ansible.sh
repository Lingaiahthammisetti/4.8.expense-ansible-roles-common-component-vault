#!/bin/bash

dnf install ansible -y

# Clone your Ansible repo
cd /tmp
git clone https://github.com/Lingaiahthammisetti/4.8.expense-ansible-roles-common-component-vault.git
cd 4.8.expense-ansible-roles-common-component-vault

# Create and secure the Vault password file
mkdir -p /etc/ansible
echo 'admin1234' > /etc/ansible/.vault_pass.txt
chmod 600 /etc/ansible/.vault_pass.txt

# Run playbooks using the Vault password file
# ansible-playbook db.yaml --vault-password-file /etc/ansible/.vault_pass.txt

# Run component playbooks
for component in db backend frontend; do
  ansible-playbook main.yaml -e "component=$component" --vault-password-file /etc/ansible/.vault_pass.txt
done



# #!/bin/bash
# dnf install ansible -y
# cd /tmp
# git clone https://github.com/Lingaiahthammisetti/4.8.expense-ansible-roles-common-component-vault.git
# cd 4.8.expense-ansible-roles-common-component-vault

# ansible-playbook main.yaml -e component=db
# ansible-playbook main.yaml -e component=db #Run twice db.yaml
# ansible-playbook main.yaml -e component=backend
# ansible-playbook main.yaml -e component=frontend