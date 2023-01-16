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
                sh 'git submodule init && git submodule update --recursive && git submodule update --remote'
            }
        }
        stage('Building image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":${GIT_COMMIT,length=8}" 
                }
            } 
        }
        // stage('Push image') { 
        //     steps { 
        //         script { 
        //             docker.withRegistry( '', registryCredential ) { 
        //                 dockerImage.push() 
        //             }
        //         } 
        //     }
        // }
        // stage('Docker compose up mysql') { 
        //     steps { 
        //         script {
        //             sh '''
        //                 cd mysql-test
        //                 docker compose up -d
        //                 cd ..
        //             '''
        //         } 
        //     }
        // }
        // stage('Docker compose up nginx') { 
        //     steps { 
        //         script {
        //             sh '''
        //                 cd nginx-test
        //                 docker compose up -d
        //                 cd ..
        //             '''
        //         } 
        //     }
        // }
    }
    post { 
        always { 
            cleanWs()
        }
    }    
}