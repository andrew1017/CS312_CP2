# Automated AWS Minecraft Server

*Created by Andrew Hays ([haysan@oregonstate.edu](mailto:haysan@oregonstate.edu))*

## Background

- TODO

## Requirements

- Terraform
  - Follow [this installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- AWS CLI
  - Follow [this installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- AWS learner lab credentials
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

## Pipeline Overview
