pipeline {
    agent any
    
    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/NaduX99/Jenkings-Pipeline.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                bat "docker build -t nadullaknidu/nodeapp-cuban:%BUILD_NUMBER% ."
            }
        }
       stage('Push Image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhubpass')]) {
                    bat "docker login -u nadullaknidu -p %dockerhubpass%"
                    bat "docker push nadullaknidu/nodeapp-cuban:%BUILD_NUMBER%"
                }
            }
        }
    } // Closes stages block
    post {
        always {
            bat 'docker logout'
        }
    }
}
