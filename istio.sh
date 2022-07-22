#istio
    minikube delete
    minikube start --driver=none --kubernetes-version v1.23.8
    helm repo add istio https://istio-release.storage.googleapis.com/charts
    helm repo update
    kubectl create namespace istio-system
    kubectl create namespace istio-ingress
