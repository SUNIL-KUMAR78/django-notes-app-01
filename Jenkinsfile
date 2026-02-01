@Library('shared') _
pipeline {
    agent { label 'sunilkumar' }

    stages {
        stage('Hello') {
            steps {
                script {
                    hello()
                }
            }
        }

        stage('Code') {
            steps {
                script {
                    clone('https://github.com/SUNIL-KUMAR78/django-notes-app-01.git','main')
                    echo 'Code Cloning Successful'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    docker_build('notes-app-01','latest','sunilkumar78')
                }
            }
        }

        stage('Push to Dockerhub') {
            steps {
                script {
                    docker_push('notes-app-01','latest','sunilkumar78')
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the code...'
                sh 'docker compose down && docker compose up -d'
            }
        }
    }
}
