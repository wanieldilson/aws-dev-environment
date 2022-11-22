$current_user = $env:USERNAME
$ssh_config_exists = Test-Path terraform.tfvars -PathType Leaf
$new_ssh = terraform output | grep -A 2 Host

if ( $ssh_config_exists ) {
    $current_ssh = Get-Content -Path C:\Users\${current_user}\.ssh\config
    Remove-Item -Path C:\Users\${current_user}\.ssh\config
}

Add-Content -path C:\Users\${current_user}\.ssh\config -value $new_ssh
Add-Content -path C:\Users\${current_user}\.ssh\config -value $current_ssh