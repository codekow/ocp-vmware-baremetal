# Bare Metal Node on VCenter

This repository is used to deploy an emulated bare metal nodes using vsbmc in VMware VCenter.

Edit the following as appropriate:
- [inventory/baremetal.yml](inventory/baremetal.yml)
- [vcenter_vars.yml](vcenter_vars_example.yml)

## Quickstart
```
# setup ansible
python -m venv venv
. venv/bin/activate

pip install -U pip
pip install -r requirements.txt

# setup ansible-vault
export ANSIBLE_VAULT_PASSWORD_FILE=~/vault_pass.txt
```

## Ansible Command
```
ansible-playbook deploy_baremetal.yml -e @vcenter_vars.yml
```

## References
- [Ansible - vmware_guest](https://docs.ansible.com/ansible/2.9/modules/vmware_guest_module.html)
- [Virtual BMC for Vsphere](https://github.com/kurokobo/virtualbmc-for-vsphere)