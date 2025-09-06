Create a Free Tier Account in AWS

Create a IAMadmin account in AWS IAM, set up MFA for this account using Google Authenticator

Remember to copy the Access Key and Secret Access Key

Take note of the IAMadmin account login URL

Designate a machine to use to run Terraform, for this example, I make use of a Kali Linux VM

Make sure terraform is installed, use command 'apt install terraform' if not installed

Login to AWS using the IAMadmin URL, create a Key-Pair and name it 'my-key-pair'

Check for an existing SSH key in your kali linux VM using the command 'ls ~/.ssh/id_rsa.pub'
  If there is no existing key, generate one with the command 'ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa' type yes to overwrite
  When asked for a passphrase, hit enter  to leave it empty
  type 'cat ~/.ssh/id_rsa.pub' and copy the public key contents of your kali linux vm, the key looks like 'ssh-rsa.....'

Go back to AWS Console and head to EC2 page and Key Pairs, click 'Import key pair', fill in the form
  Name: my-key-pair
  Key type: RSA
  Public key contaents: <paste in your public key here>

Do a terraform reset just in case, type the command 'rm -rf .terraform terraform.tfstate terraform.tfstate.backup .terraform.lock.hcl'

Install AWS Cli using the command 'apt install awscli -y'

Create a directory ~/aws-terraform and inside the directory, you will copy and paste the three .tf terraform files into the directors
  main.tf, variables.tf, outputs.tf

Now we are ready to start the terraform process, do the following 4 commands and you should not have any errors
  terraform init
  terraform validate
  terraform plan
  terraform apply

If the terraform scripts run correctly, you should see the following
Outputs:                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                       
ubuntu1_ip = "54.x.x.x"                                                                                                                                                                                                                                           
ubuntu2_ip = "54.x.x.x" 

This means you have successfully provisioned 2 free tier Ubuntu EC2 machines in AWS!

You may not SSH into the two machines using the following commands

🔐 SSH into the Instances
ssh -i ~/.ssh/id_rsa ubuntu@<ubuntu1_ip>
ssh -i ~/.ssh/id_rsa ubuntu@<ubuntu2_ip>

🧹 Destroy When Done
To delete everything and avoid charges:
terraform destroy

To make sure the terraform destroy has really deleted all the configurations, you may log into AWS and check the following:
  Check VPC, nothing left
  Check subnet, nothing left
  Check route table, left the undeletetable route
  Check Internet gateway, default one left
  Check security group, left default
  Check EC2, No instances left

That's all folks.




