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

## Prerequisites
- A Windows machine
- A working installation of [vscode](https://code.visualstudio.com/download)

## Contents
1. Creating an AWS account
2. Creating an SSH key
3. Installing terraform
4. Deploying your dev instance
5. Connect to your instance

## Creating an AWS account
Follow [this guide](https://youtu.be/FRQ9fE4fd5g) to create and secure a new AWS account.  


