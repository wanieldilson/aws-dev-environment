# AWS Dev Instance for VScode

## Overview
Are you fed up with trying to awkwardly develop on a windows machine, tried WSL2 and woke up one day to it being totally bawked by Windows 11? Fear not - Your free-tier AWS dev environment is here!  This is a slight extension of [Derek Morgan's course](https://courses.morethancertified.com/p/rfp-terraform) that teaches you how to build a dev instance in AWS using terraform.

---

## What you'll get..
After running through this readme you will have a way to spin up a development instance in AWS at will.  It will be accessible from your local machine over SSH using the native plugin for VScode.  Your Dev instance will:
- Be running Ubuntu
- Have python3 installled
- Have Docker installed
- Have Terraform installed
- Have an IAM role attached with Admin access to your AWS account

So What are you waiting for!? Clone this repo and let's do it.

## Prerequisites
- A Windows machine
- A working installation of [vscode](https://code.visualstudio.com/download)
- [Chocolatey](https://chocolatey.org/install) package manager for Windows - Not essential but helps!

## Contents
1. [Creating an AWS account](#creating-an-aws-account)
1. [Creating Terraform credentials in AWS](#creating-terraform-credentials-in-aws)
2. [Creating an SSH key](#creating-an-ssh-key)
3. [Installing terraform](#installing-terraform)
4. Deploying your dev instance
5. Connect to your instance

## Creating an AWS account
Follow [this guide](https://youtu.be/FRQ9fE4fd5g) to create and secure a new AWS account.  

## Creating terraform credentials in AWS
- Log into your AWS account using the IAM user created in step 4 of the [creating an AWS account video guide](https://youtu.be/FRQ9fE4fd5g) linked in the previous step.

![IAM Console](./gifs/IAM.gif)

- Create a new user with programatic access only and save the Access and Secret keys somewhere safe!

![Create User](./gifs/USER.gif)

- 

## Creating an SSH key
- In a PowerShell window enter the command `ssh-keygen -t ed25519` to create your keypair.
![Generate SSH Key](./gifs/GENERATE_SSH.gif)
- Copy your public key to the root directory of this repo. `cp ~/.ssh/awsDevInstanceKey.pub .` you'll need it later!

## Installing Terraform
- If you already have Chocolatey installed then simply run `choco install terraform`
- If you're unable to install chocolatey then follow [these steps](https://spacelift.io/blog/how-to-install-terraform) to get terraform installed

## Deploying your Dev instance
- Firstly generate your tfvars file by running `./scripts/generate_tfvars.ps1`
    - This script will pull your public IP from whatsmyip.com and also set the local_development variable to _true_
