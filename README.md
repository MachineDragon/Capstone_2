# Capstone_2


Requirements:

Virtualbox https://www.virtualbox.org/wiki/Downloads
Ubuntu 20.04 LTS Image ISO https://ubuntu.com/download/desktop

On virtual Machine - minimal installation

after installing complete, select Devices >> Insert guest additions and install

open up terminal and run 

>>>>>     sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
>>>>>     reboot

Now Virtual Machine is ready To start the project


Setting Up a Kubernetes Environment using Terraform

Launch the terminal and type

>>>> sudo apt install minikube
>>>> sudo apt install curl
>>>> sudo apt install terraform
>>>> sudo apt install docker
>>>> sudo apt install docker.io
>>>> sudo snap install google-cloud-sdk --classic

>>>> sudo docker login
>>>> -- you need to create a dockerhub account for this part, sign up at https://hub.docker.com/
>>>> sudo systemctl start docker
>>>> sudo systemctl enable docker
>>>> 

>>>> gcloud auth login
>>>> log into your gmail account
>>>> gcloud init
>>>> 1
>>>> 1
>>>> y
>>>> give your project a name






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



