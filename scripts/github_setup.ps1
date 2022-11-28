## This script takes the first IP address in your SSH config and copies your SSH private key to it
$ssh_key_name = Read-Host "Enter the name of your SSH key e.g awsDevInstanceKey"
$ec2_instance_ip = Get-Content ~\.ssh\config | grep -o -m 1 '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
Copy-Item ~\.ssh\${ssh_key_name} .
scp -i ~\.ssh\${ssh_key_name} .\${ssh_key_name} ubuntu@${ec2_instance_ip}:/home/ubuntu/.ssh
scp -i ~\.ssh\${ssh_key_name} .\scripts\config ubuntu@${ec2_instance_ip}:/home/ubuntu/.ssh
Remove-Item ${ssh_key_name} 
$line = "=" * 85

Write-Host $line -ForegroundColor Yellow
Write-Host -NoNewline "Your SSH key ${ssh_key_name} has now been copied to your remote machine "
Write-Host -ForegroundColor DarkGreen "${ec2_instance_ip}"
Write-Host "On your remote machine please run the following command"
Write-Host -ForegroundColor DarkGreen "chmod 600 ~/.ssh/${ssh_key_name}" 
Write-Host $line -ForegroundColor Yellow

