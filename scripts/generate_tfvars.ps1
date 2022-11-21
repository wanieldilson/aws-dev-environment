$public_ip = curl whatsmyip.com | grep -o -m 1 '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
$tfvars_exists = Test-Path terraform.tfvars -PathType Leaf

if ( $tfvars_exists ) {
    rm terraform.tfvars
}

add-content -path terraform.tfvars -value "local_dev          = true"
add-content -path terraform.tfvars -value "local_ip           = `"${public_ip}`""

