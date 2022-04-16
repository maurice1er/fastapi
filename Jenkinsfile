pipeline{
    agent any
    // agent { docker { image 'python:3.8' } }

    stages{
        stage("Build image"){
            steps{
                sh "pwd"  
                sh "docker system prune"
                sh "docker images"
                sh "docker build -t fastapi:1.0 ."
                sh "docker images"
            }
        }
        stage("Test app"){
            steps{
                sh "python3 test_api.py"
            }
        }
        stage("Run container"){
            steps{
                script{
                    try{
                        sh "docker rm -f fastapi"
                    }
                    catch (err){
                        echo "Erreur de suppression du container fastapi"
                        echo "${err}"
                    }
                }
                sh "docker run -itd -p 9009:8080 --name fastapi fastapi:1.0"
            }
        }
    }
}