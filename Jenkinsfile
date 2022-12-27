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
                    sh "docker image save $registry:$BUILD_NUMBER -o nginx.tar"
                }
            }
        }
        stage('Cleaning up') {
            steps {
                script {
                    sh "docker rmi $registry:$BUILD_NUMBER"
                }
            }
        }
    }
    // post { 
    //     always { 
    //         cleanWs()
    //     }
    // }    
}