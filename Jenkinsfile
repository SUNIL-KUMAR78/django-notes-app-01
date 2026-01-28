@Library('Shared')_
pipeline{
    agent { label 'sunilkumar'}
    
    stages{
        stage('Code'){
            steps{
                sh 'whoami'
            clone("https://github.com/SUNIL-KUMAR78/django-notes-app-01.git","main")
            }
        }
        stage("Build"){
            steps{
            dockerbuild("notes-app-01","latest","sunilkumar78")
            }
        }
        stage("Push to DockerHub"){
            steps{
                dockerpush("dockerHubCreds","notes-app-01","latest","sunilkumar78")
            }
        }
        stage("Deploy"){
            steps{
                deploy()
            }
        }
        
    }
}
