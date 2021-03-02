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
>>> cd ~/terraform
>>> nano config.tf
>>> 
>>> COPY THIS INTO YOUR NANO FILE AND SAVE USING CTRL+X or you can edit this with the text editor of your choice
# main.tf
provider "kubernetes" {}
>>> COPY THIS INTO YOUR NANO FILE AND SAVE USING CTRL+X or you can edit this with the text editor of your choice
>>> 


>>> terraform init
>>> 
This should run successful or your missing a few things





>>> sudo apt update



NOW WE ARE READY TO START OUR elastic kubernetes service(EKS) hosted on amazon AWS

WARNING THIS MIGHT CHARGE 



















































































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



