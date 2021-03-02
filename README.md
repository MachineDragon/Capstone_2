# Capstone_2


Requirements:

Virtualbox https://www.virtualbox.org/wiki/Downloads
Ubuntu 20.04 LTS Image ISO https://ubuntu.com/download/desktop





On virtual Machine 
Select new

Type    >>>>>> Linux
Version >>>>>> Ubuntu(64-bit)
Ram( the more you give it the faster the vm will be)

Create a virtual hard disk now

VDI

Dynamically Allocated

50 gb to be on the safe side

Now click settings >> Advanced

Shared clipboard && Drag'n'Drop to biderectional

Start 

Select start-up disk
click on the folder icon

Press add, now go to your Ubuntu 20.04 image downloaded the previous step

- minimal installation

after installing complete, select Devices >> Insert guest additions and install

open up terminal and run 

>>>     sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
>>>     reboot

Now Virtual Machine is ready To start the project


Setting Up a Kubernetes Environment using Terraform

Launch the terminal and type

>>>> sudo apt install minikube
>>>> sudo apt install curl
>>>> sudo apt install terraform
>>>> sudo apt install docker
>>>> sudo apt install docker.io
>>>> sudo snap install google-cloud-sdk --classic
>>>> sudo apt-get install zip -y
>>>> sudo apt install wget
>>>> sudo apt install kubectl

>>>> sudo docker login
>>>> -- you need to create a dockerhub account for this part, sign up at https://hub.docker.com/
>>>> sudo systemctl start docker
>>>> sudo systemctl enable docker
>>>> 



DOWNLOADING TERRAFORM
Go to this link
https://www.terraform.io/downloads.html

select which operating system your using and right click on the blue hyperlink, select copy link address

Now in your terminal run wget (and the link of your osversion-download without the parenthases)

ex.) wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip

>>> ls
>>> now you should see your folder here and need to unzip it
>>> unzip terraform_0.14.7_linux_amd64.zip 
>>> 
>>> Now we need to move this folder 
>>> sudo mv terraform /bin
>>> 


>>> mkdir ~/terraform
>>> 
>>> cd ~/terraform
>>> 

>>> nano config.tf
>>> 
>>> COPY THIS INTO YOUR NANO FILE AND SAVE USING CTRL+X or you can edit this with the text editor of your choice
>>> 
>>> // #main.tf
provider "kubernetes" {}
>>> COPY THIS INTO YOUR NANO FILE AND SAVE USING CTRL+X or you can edit this with the text editor of your choice
>>> 


>>> terraform init
>>> 
This should run successful or your missing a few things





>>> sudo apt update



NOW WE ARE READY TO START OUR elastic kubernetes service(EKS) hosted on amazon AWS

WARNING THIS MIGHT CHARGE your account proceed at your own risk of getting charged


Setting up IAMS Account

Go here https://aws.amazon.com/

select sign in to the console window


search users
select users with IAM feature

Create a new user

check Programmatic access and AWS Management Console access
leave unchecked Require password reset

select next

select Attach existing policies directly

check AdministratorAccess
select next
skip tags press next

select create user
select Download.csv file

SAVE THIS FILE IN A SECURE LOCATION, Recommended to backup on clout

now you need your region, look in your searchbar on the top it should say its location
ex.) https://console.aws.amazon.com/iam/home?region=us-east-2
mine is us-east-2
you will need this for the next step

open this file to get the access keys


Now reopen your terminal and type 

$ aws configure
AWS Access Key ID [None]: YOUR_AWS_ACCESS_KEY_ID                                         enter your credentials from the file we just downloaded
AWS Secret Access Key [None]: YOUR_AWS_SECRET_ACCESS_KEY                                 
Default region name [None]: YOUR_AWS_REGION                                                      
Default output format [None]: json





>>> AHNBFDIU324H27ED8WD78!SFDW/ 
>>> 6DSFJH34R7YFER8WEHT847TG7ER8TGYHRIGYU4589TU5IRUT
>>> us-east-2                                 <<<<< for this step enter your specific region
>>> json
>>> 



we are now setup and configured your aws to interact with your local machine CONGRATS!!! :)



Documentation from hashicorp on how to launch eks cluster gotten from hashicorp website
https://learn.hashicorp.com/tutorials/terraform/eks?in=terraform/kubernetes&utm_source=WEBSITE&utm_medium=WEB_BLOG&utm_offer=ARTICLE_PAGE


git clone https://github.com/hashicorp/learn-terraform-provision-eks-cluster


cd learn-terraform-provision-eks-cluster


terraform init


terraform apply


>>> enter yes
>>> 
this should take about 10 minutes +



aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)


wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz


kubectl apply -f metrics-server-0.3.6/deploy/1.8+/

kubectl get deployment metrics-server -n kube-system

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml



kubectl proxy



NOW IN YOUR SEARCH BAR PASTE THIS IN
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

SELECT TOKEN

OPEN A NEW TERMINAL
kubectl apply -f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-eks-cluster/master/kubernetes-dashboard-admin.rbac.yaml

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')


YOU SHOULD SEE CERTIFICATE-AUTHORITY-DATA: FOLLOWED BY AN EXTREMELY LONG SET OF CHARACTER STRINGS, COPY THIS STRING INTO TOKEN

NOW SELECT NODES AND YOU SHOULD SEE YOUR KUBERNETES CLUSTER WHICH YOUB USED TERRAFORM TO SETUP YOUR KUBERNETES CLUSTER ENVIRONMENT










install jenkins


sudo apt update
sudo apt install openjdk-11-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install jenkins

systemctl status jenkins




sudo ufw allow proto tcp from 192.168.121.0/24 to any port 8080


sudo ufw allow 8080



NOW ON BROWSER SEARCH localhost:8080


sudo cat /var/lib/jenkins/secrets/initialAdminPassword

enter this password

install suggested plugins


make and account, save and finish


manage plugins

available

convert to pipeline
shiningpanda

docker pipeline
kubernetes




































































>>>> curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
>>>> curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
>>>> echo "$(<kubectl.sha256) kubectl" | sha256sum --check
>>>> 

>>>> sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


>>>> sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
>>>> curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
>>>> echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
>>>> sudo apt-get update
>>>> sudo apt-get install -y kubectl










>>>> mkdir dev
>>>> cd dev
>>>> 

















>>>> kubectl apply -f terraform-helm/example/workspace_registry.yaml -n prepod



