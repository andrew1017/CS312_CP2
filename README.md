# Automated AWS Minecraft Server

*Created by Andrew Hays ([haysan@oregonstate.edu](mailto:haysan@oregonstate.edu))*

## Background

- TODO

## Requirements

- **Windows Powershell**
  - This tutorial assumes you are using a Windows machine.
  - All commands intended for Powershell.
  
- **Terraform**
  - Follow [this installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- **AWS CLI**
  - Follow [this installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- **AWS learner lab credentials**
  - From the learner lab page:
    - Start the lab
    - Click "AWS Details" 
      - In the Details pane, you should see a block of text formatted as such:
        ```
        [default]
        aws_access_key_id=
        aws_secret_access_key=
        aws_session_token=
        ```
      -  Create a new file ```~/.aws/credentials``` and copy in this text
      -  **NOTE** For this tutorial to work, your AWS region should be **us-east-1**
 
- **Git**
  - You will need git to clone this repo

- **Ansible**
  - Follow [this installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#windows)

## Pipeline Overview

- TODO: Diagram

## Commands

*Powershell Commands*

- First open a Powershell instance as administrator
- Clone this REPO and switch to the directory:
  - ```git clone https://github.com/andrew1017/CS312_CP2.git```
  - ```cd CS312_CP2```
- Use Terraform commands to create resources from **main.tf,** answering "yes" to any prompts:
  1. ```terraform init```
  2. ```terraform apply```
  

    
 

