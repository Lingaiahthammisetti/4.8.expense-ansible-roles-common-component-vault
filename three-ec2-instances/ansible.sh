#!/bin/bash
dnf install ansible -y
cd /tmp
git clone https://github.com/Lingaiahthammisetti/4.8.expense-ansible-roles-common-component-vault.git
cd 4.8.expense-ansible-roles-common-component-vault
ansible-playbook main.yaml -e component=db
ansible-playbook main.yaml -e component=db #Run twice db.yaml
ansible-playbook main.yaml -e component=backend
ansible-playbook main.yaml -e component=frontend