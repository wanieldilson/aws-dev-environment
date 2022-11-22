$public_ip = Invoke-WebRequest whatsmyip.com | grep -o -m 1 '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
$tfvars_exists = Test-Path terraform.tfvars -PathType Leaf

if ( $tfvars_exists ) {
    Remove-Item terraform.tfvars
}

add-content -path terraform.tfvars -value "local_dev          = true"
add-content -path terraform.tfvars -value "local_ip           = `"${public_ip}`""

