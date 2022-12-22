pipeline {
    environment {
        imagename = "nginx"
    }
    agent any
    stages { 
        stage('Clone SCM') { 
            steps { 
                cleanWs()
                checkout scm
            }
        }
        stage('Building image') {
            steps{
                script {
                dockerImage = docker.build imagename
                }
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }    
}