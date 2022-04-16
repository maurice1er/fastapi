pipeline{
    agent any

    stages{
        stage("TEST"){
            steps{
                sh "pwd"
                sh "pytest -v"
                
                sh "docker build -t fastapi:1.0 ."
            }
        }
        stage("Build"){
            steps{
                echo "Build.."
            }
        }
    }
}