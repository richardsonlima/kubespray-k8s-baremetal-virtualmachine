ansible-playbook -i hosts.ini -u devops -k playbook.yml --extra-vars "ansible_sudo_pass=5up3rs3cr37 user=devops group=devops pubkeypath=/home/devops/.ssh/id_rsa.pub"
#ansible-playbook -i hosts.ini -u root -k playbook.yml 
