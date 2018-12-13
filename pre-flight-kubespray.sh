#/bin/bash 
#set -x 

function getkubespray(){
  echo -e '[+] \033[1;32m cloning kubespray repo \033[0m'
  git clone https://github.com/kubernetes-incubator/kubespray /opt/kubespray
  cd /opt/kubespray
}

function gettags(){
  echo -e '[+] \033[1;32m Get new tags from remote \033[0m'
  git fetch --tags
}

function getlasttag(){
  echo -e '[+] \033[1;32m Get latest tag name \033[0m'
  latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
}

function checkout(){
  echo -e '[+] \033[1;32m checkout latest tag \033[0m'
  git checkout $latestTag
}

function installreq(){
  echo -e '[+] \033[1;32m Install dependencies from requirements.txt \033[0m' 
  pip install -r requirements.txt
}

function copysample(){
  echo -e '[+] \033[1;32m Copy inventory/sample as inventory/mycluster \033[0m' 
  cp -rfp inventory/sample inventory/mycluster
}

function updateinventory(){
        
  declare -a IPS=(192.168.56.101 192.168.56.105 192.168.56.102 192.168.56.103)
  CONFIG_FILE=inventory/mycluster/hosts.ini python3.6 contrib/inventory_builder/inventory.py ${IPS[@]}
}

function deploycluster(){
    echo -e '[+] \033[1;32m Deploying k8s Cluster \033[0m' 
	ansible-playbook -u devops -b -i inventory/mycluster/hosts.ini cluster.yml # don't forget create a password less interaction using ssh key 
}
#getkubespray
#gettags
#getlasttag
#checkout
#installreq
#copysample
#updateinventory
deploycluster