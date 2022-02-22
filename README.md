# Bare Metal Node on VCenter

This repository is used to deploy emulated bare metal nodes using vsbmc in VMware VCenter.

Edit the following as appropriate:
- [inventory/baremetal](inventory/baremetal)
- [vcenter_vars.yml](vcenter_vars_example.yml) rename / modify the example with login info, etc

## Quickstart Setup
```
# activate python env
python -m venv venv
. venv/bin/activate
```

```
# everything below is a one time setup
# this installs ansible in your virtualenv

# setup ansible
pip install -U pip
pip install -r requirements.txt

# install collection
ansible-galaxy collection install -r ansible-galaxy.yml
```

## Ansible Commands
```
# deploy all the things
ansible-playbook playbooks/main.yml -e @vcenter_vars.yml
```

```
# deploy only bare metal emulated vms
ansible-playbook playbooks/playbooks/deploy_vmware_baremetal.yml -e @vcenter_vars.yml
```

## References
- [Ansible - vmware_guest](https://docs.ansible.com/ansible/2.9/modules/vmware_guest_module.html)
- [Virtual BMC for Vsphere](https://github.com/kurokobo/virtualbmc-for-vsphere)
