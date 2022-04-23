pipeline{
    agent any
    // agent { docker { image 'python:3.8' } }

    stages{
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
                sh "pwd"
                sh "ls -la"
                sh "docker run -itd -p 9009:8080 --name fastapi -v ${PWD}:/usr/src/app fastapi:1.0"
                sh "pwd"
                sh "ls -la"
            }
        }
        stage("Test app"){
            steps{
                sh "pwd"
                sh "ls -la"
                sh "docker exec fastapi pytest --verbose --junit-xml=test-reports/results.xml test_api.py"
                sh "ls -la"
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
    }
}