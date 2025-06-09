# Automated AWS Minecraft Server

*Created by Andrew Hays ([haysan@oregonstate.edu](mailto:haysan@oregonstate.edu))*

## Background

- TODO

## Requirements

- **Windows Powershell**
  - This tutorial assumes you are using a Windows machine.
  - I used Powershell version **5.1.19041.5848**
  
- **Terraform**
  - Follow [this installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
  - This should be installed on your Windows machine
  - I used Terraform version **1.12.1**

- **AWS CLI**
  - Follow [this installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
  - This should be installed on your Windows machine
  - I used version **2.27.31**

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
  - I used version **2.38.1.windows.1**

- **WSL**
  - You will need WSL to use Ansible
  - [Follow this tutorial](https://learn.microsoft.com/en-us/windows/wsl/install) to install WSL
  - I used version **2.5.7.0**

- **Ansible**
  - Follow [this installation guide](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu)
  - This should be installed through your WSL terminal.
  - I used version **2.16.5** with Python version **3.12.3**


## Pipeline Overview

- TODO: Diagram

## Commands

### Part 1: Powershell

- First open a Powershell instance as administrator

- Clone this REPO and switch to the directory:
  - ```git clone https://github.com/andrew1017/CS312_CP2.git```
  - ```cd CS312_CP2```
  
- Use Terraform commands to create resources from **main.tf,** answering "yes" to any prompts:
  1. ```terraform init```
  2. ```terraform apply```
  3. ```terraform output -raw private_key_pem > minecraft-key.pem```
     - This creates a key file called "minecraft-key.pem"

### Part 2: WSL

- Open a WSL terminal
- Access your local directory for the project via the ```mnt`` folder in WSL:
  - Example command: ```cd /mnt/c/Users/chris/Documents/CS312_CP2```
- We need to create a copy of the minecraft key file in our WSL home directory.
  1. Create the new file in WSL Home with: ```nano ~/.minecraft-key.pem```
  2. Manually copy and paste the contents of the original minecraft-key.pem file from your Windows machine into this new version we made in WSL home.
     - I recommend simply opening the original file with Notepad, selecting all the text and copying it into the new version opened in WSL.
  3. Set permissions for the WSL copy of our key with ```chmod 600 ~/.minecraft-key.pem```
- Finally, we use Ansible to set up the server with:
  - ```ansible-playbook -i inventory setup-minecraft.yml```

  
  

    
 

