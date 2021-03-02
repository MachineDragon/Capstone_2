pipeline {
	agent any 
	environment {
		DOCKER_HUB_REPO = "mikehj24/capstone2"
		CONTAINER_NAME = "capstone2"
		REGISTRY_CREDENTIAL = "dockerhub"
	}
  
	stages {
		stage('Clean Workspace') {
				script {
          sh 'rm -rf Capstone_2'			
			}
		}
		stage('Clone Repo') {
			
				script {
          sh 'git clone https://github.com/mikehj122498/Capstone_2.git'			
			}
		}
		stage('Docker Build') {
			
				script {
					dir('./Capstone_2') {
						sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
						sh 'docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'
            echo "your image was built successfully"
					} 				
			}
		}
		stage('Push docker image') {
      steps {
			    script {		        
				        docker.withRegistry( '', REGISTRY_CREDENTIAL ) {
				            sh 'docker push mikehj24/capstone2:$BUILD_NUMBER'
				            sh 'docker push mikehj24/capstone2:latest'				    				        
				    }		
          }
			}
		}
		stage('Deploy to kubernetes') {		
			  
				    script {
					    sh 'kubectl apply -f kubernetes.yaml'
                        sh 'kubectl get service/capstone2-service'
				    
			}
		}
	}
}
