# Kubespray - k8s on centos7 [ baremetal / virtual machine]

Ansible playbook to configure prerequisites for Kubespray on CentOS7

Prerequisites for the CentOS7 machines:
* SSH access using password with a user who has root permissions (centos in example)
* A public key generated on your local machine

This playbook will:
* Update packages
* Install network tools
* Install and configure ntpd
* disable firewall
* disable swap
* enable passwordless sudo
* enable passwordless SSH
* set hostname

Add the IP's of your CentOS7 servers in the `hosts.ini`.

```
[all]
node1 ansible_host=192.168.56.101
node2 ansible_host=192.168.56.102
node3 ansible_host=192.168.56.103
node4 ansible_host=192.168.56.104

```

Start the playbook. Define variables like root password, user, group and path to the public key.

```bash
$ bash ./pre-env-ansible.sh 
```

After running the playbook you can start with [Kubespray](https://github.com/kubernetes-incubator/kubespray):
```
$ bash ./pre-flight-kubespray.sh
```

More details and configuration can be found [here](https://blog.richardsonlima.com.br/install-kubernetes-on-bare-metal-centos7).
