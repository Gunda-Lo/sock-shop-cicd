# Provision EC2 instance for  Jenkins Server using Terraform

Using >terraform< you can automate the provisioning of your jenkins server EC2 instance.
First off you need to create an IAM user that has permissions to create EC2 instances and use the credentials to grant terraform acces to your AWS account.
You will need a way to pass the credentials securely into your terraform script, for this purpose we willl use >Hashicorp Vault<.

## Hashicorp Vault

Vault provides you with a way to store your cedentials, key value pairs, and sensitive information as secrets to later be called upon in your scripts or just decrypted.
You can read up on >Hashicorp Vault< here [](https://developer.hashicorp.com/vault/docs)