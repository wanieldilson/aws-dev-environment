$aws_access_key = Read-Host "Enter AWS Access Key"
$aws_secret_key = Read-Host "Enter AWS secret Key"
$current_user = $env:USERNAME

Add-Content -path C:\Users\${current_user}\.aws\credentials -value "[vscode]" 
Add-Content -path C:\Users\${current_user}\.aws\credentials -value "aws_access_key_id = ${aws_access_key}" 
Add-Content -path C:\Users\${current_user}\.aws\credentials -value "aws_secret_access_key = ${aws_secret_key}" 

Write-Host "AWS credentials file created"