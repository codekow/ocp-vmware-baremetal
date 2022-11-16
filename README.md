# Bare Metal Node on VCenter

This repository is used to deploy emulated bare metal nodes using vsbmc in VMware VCenter.

Edit the following as appropriate:
- [inventory](inventory)
- [vcenter_vars.yml](vcenter_vars_example.yml) - rename / modify the example with login info, etc

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

## VMware Notes

Assumption: Two vCenter Accounts
- Admin Account
- Installer Account (w/ roles assigned)


Script to setup roles in vCenter
```
# setup vmware roles (optional)
. hacks/vsphere_roles.sh
vsphere_create_roles
```

### Admin Account

`hacks/vsphere_roles.sh` is available to help automate the creation of vCenter roles with a vCenter administrator account.

### Installer Account

Assign the following roles to the vCenter account being used to install OpenShift at various levels in vCenter listed below.

### Precreated virtual machine folder in vSphere vCenter

Role Name | Propagate | Entity
--- | --- | ---
openshift-vcenter-level | False | vCenter
ReadOnly | False | Datacenter
openshift-cluster-level | True | Cluster
openshift-datastore-level | False | Datastore
ReadOnly | False | Switch
openshift-portgroup-level | False | Port Group
ReadOnly | True | Virtual Machine folder (Top Level)
openshift-folder-level | True | Virtual Machine folder

In a cascading (nested) folder organization you will need  "`Read-only`" permissions 
with "`Propagate to children`" from the top folder level.

Example Service Account: `OCPInstaller`

## References
- [Ansible - community.vmware.vmware_guest](https://docs.ansible.com/ansible/2.10/modules/vmware_guest_module.html)
- [Virtual BMC for Vsphere](https://github.com/kurokobo/virtualbmc-for-vsphere)
- [CentOS 8 - Cloud Images](https://cloud.centos.org/centos/8-stream/x86_64/images)
