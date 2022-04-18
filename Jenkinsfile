pipeline{
    agent any
    // agent { docker { image 'python:3.8' } }

    stages{
        stage("venv"){
            steps{
                sh "pwd"  
                sh "ls -la"  
                sh "python3 -m venv myenv"
                sh "source myenv/bin/activate"
                sh "python3 -r install requirements.txt"
                sh "pytest -v"
            }
        }
        stage("Build image"){
            steps{
                sh "pwd"  
                sh "ls -la"  
                sh "docker system prune --filter 'app=fastapi'"
                sh "docker images"
                sh "docker build -t fastapi:1.0 ."
                sh "docker images"
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
        stage("Test app"){
            steps{
                sh "docker exec fastapi pytest"
            }
        }
    }
}