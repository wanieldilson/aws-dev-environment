## This script takes the first IP address in your SSH config and copies your SSH private key to it

$ec2_instance_ip = cat ~\.ssh\config | grep -o -m 1 '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
cp ~\.ssh\id_ed25519 .
scp -i ~\.ssh\id_ed25519.pub .\id_ed25519 ubuntu@${ec2_instance_ip}:/home/ubuntu/.ssh
rm id_ed25519

## Don't forget to chmod 600 your private key on the remote instance