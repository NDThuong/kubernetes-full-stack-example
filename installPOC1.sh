#java
sudo apt-get update
sudo apt install openjdk-11-jre-headless

#jenkins
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install jenkins
    sudo service jenkins status

#docker
    sudo apt-get install docker.io
    sudo systemctl start docker
    sudo usermod -aG docker $USER
    sudo usermod -aG docker ubuntu
    sudo usermod -aG docker jenkins

#minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    
#kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#helm
    wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
    tar xvf helm-v3.4.1-linux-amd64.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin
    rm helm-v3.4.1-linux-amd64.tar.gz
    rm -rf linux-amd64
