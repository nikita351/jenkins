pipeline {
    environment {
        registry = "nikita351/final_project" 
        registryCredential = 'nikita351' 
        dockerImage = ''
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
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Push image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        }
        stage('Save image') {
            steps {
                script {
                    docker.save($registry:$BUILD_NUMBER -o $registry:latest)
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