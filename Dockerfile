@Library ('shared') _
pipeline{
    agent{ label 'sunilkumar' }
    stages{
        stage('Hello'){
            steps{
                script{
                    hello()
                }
            }
        }
        
        stage('Code'){
            steps{
                script{
                    clone('https://github.com/SUNIL-KUMAR78/django-notes-app-01.git','main')
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    docker_build('notes-app-01','latest','sunilkumar78')
                }
            }
        }
        stage('push to Dockerhub'){
            steps{
                script{
                    docker_push('notes-app-01','latest','sunilkumar78')
                }
            }
        }
        stage('Deploy'){
            steps{
                echo 'This is deploying the code'
                sh 'docker compose up -d'
            }
        }
    }
}
