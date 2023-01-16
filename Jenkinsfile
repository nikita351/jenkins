pipeline {
    environment {
        registry = "nikita351/final_project" 
        registryCredential = 'nikita351' 
        dockerImage = ''
        git_hash = GIT_COMMIT.take(8)
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
        // stage('Building image') { 
        //     steps { 
        //         script { 
        //             dockerImage = docker.build registry + ":$git_hash" 
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
                        cd mysql-test
                        docker compose build --build-arg BUILD_TAG=${git_hash}
                        docker images
                        cd ..
                    '''
                } 
            }
        }
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