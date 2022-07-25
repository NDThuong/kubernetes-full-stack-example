node {

//     stage("Git Clone"){

//         git credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/NDThuong/kubernetes-full-stack-example.git'
//     }

    stage("Docker build"){
        sh 'docker version'

        dir ("spring-boot-student-app-api"){
            sh 'mvn install'
        }

        dir ("react-student-management-web-app"){
            sh 'docker build -t ndthuong/student-app-client:1.0.0 .'
        }
    }

        withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
            sh 'docker login -u ndthuong -p $PASSWORD'
        }
    stage("Push Image to Docker Hub"){
        dir ("spring-boot-student-app-api"){
            sh 'mvn dockerfile:push'
        }
        sh 'docker push ndthuong/student-app-client'
    }
    stage("istio"){
        sh 'helm repo add istio https://istio-release.storage.googleapis.com/charts'
        sh 'kubectl create namespace istio-system'
        sh 'helm upgrade istio-base istio/base -n istio-system --install'
        sh 'helm upgrade istiod istio/istiod -n istio-system --wait --install'
        sh 'kubectl label namespace default istio-injection=enabled --overwrite'
        sh 'helm upgrade istio-ingress istio/gateway -f dieuthuong.yaml --install'
        sh 'kubectl apply -f gateway.yaml'
    }
    stage("Deploy React application"){
        sh 'helm upgrade thuongapp oneforall --install'
        
        
    }
   stage("prometheus"){
        sh 'helm repo add prometheus-community https://prometheus-community.github.io/helm-charts'
        sh 'helm upgrade prometheus prometheus-community/prometheus --install'
        
    }
    stage("granfana"){
        sh 'helm repo add bitnami https://charts.bitnami.com/bitnami'
        sh 'helm upgrade grafana bitnami/grafana --install'
        
    }
    
}
