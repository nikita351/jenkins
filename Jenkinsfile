pipeline {
    environment {
        registry = "nikita351/final_project" 
        registryCredential = 'nikita351' 
        dockerImage = ''
    }
    agent {label 'docker'}
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
        stage('Docker compose up mysql') { 
            steps { 
                script {
                    sh 'cd mysql'
                    sh 'docker compose up -d'
                    sh 'cd ..'
                } 
            }
        }
        stage('Docker compose up nginx') { 
            steps { 
                script {
                    sh 'cd nginx'
                    sh 'docker-compose up -d'
                    sh 'cd ..'
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