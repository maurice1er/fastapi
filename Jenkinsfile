pipeline{
    agent any
    // agent { docker { image 'python:3.8' } }

    stages{
        stage("Build"){
            steps{
                sh "pwd"  
                sh "docker system prune"
                sh "docker images"
                sh "docker build -t fastapi:1.0 ."
                sh "docker images"
            }
        }
        stage("Run"){
            steps{
                sh "docker run -itd -p 9009:8080 --name fastapi fastapi:1.0"
            }
        }
        stage("Test"){
            steps{
                sh "docker exec -it fastapi pytest -v"
            }
        }
    }
}