#/bin/bash

###Passwordless ssh_automation

echo "Username of remote server"
read user
echo "Password of remote server"
read pass
echo "Hostname of remote server"
read hostname


echo -e "\n"|ssh-keygen -t rsa -N ""
cat <<EOF > /tmp/ssh_directory.sh
       #!/bin/bash
       pwd >> read result_pwd
       if [[ -d $result_pwd/.ssh ]]
       then
       		echo ".ssh exists on your filesystem."
       else 
       		mkdir -p .ssh
       fi
EOF
chmod a+x /tmp/ssh_directory.sh
sshpass -p $pass scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /tmp/ssh_directory.sh $user@$hostname:/tmp/ssh_directory.sh
sleep 5
sshpass -p $pass  ssh   -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $user@$hostname "/tmp/ssh_directory.sh"
cat .ssh/id_rsa.pub | sshpass -p $pass ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  $user@$hostname 'cat >> .ssh/authorized_keys'
sshpass -p $pass ssh $user@$hostname "chmod 700 .ssh ; chmod 640 .ssh/authorizes_keys"


