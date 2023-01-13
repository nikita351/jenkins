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
                sh 'git submodule init && git submodule update --recursive'
            }
        }
        // stage('Building image') { 
        //     steps { 
        //         script { 
        //             dockerImage = docker.build registry + ":$BUILD_NUMBER" 
        //         }
        //     } 
        // }
        // stage('Push image') { 
        //     steps { 
        //         script { 
        //             docker.withRegistry( '', registryCredential ) { 
        //                 dockerImage.push() 
        //             }
        //         } 
        //     }
        // }
        stage('Docker compose up mysql') { 
            steps { 
                script {
                    sh '''
                        ls -la
                        cd mysql-test
                        ls -la
                        docker compose up -d
                        cd ..
                        ls -la
                    '''
                } 
            }
        }
        stage('Docker compose up nginx') { 
            steps { 
                script {
                    sh '''
                        ls -la
                        cd nginx-test
                        ls -la
                        docker compose up -d
                        cd ..
                        ls -la
                    '''
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