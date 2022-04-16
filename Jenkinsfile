pipeline{
    agent any

    stages{
        stage("TEST"){
            steps{
                sh "pwd"
                sh "ls -l"
                echo "Test.."
            }
        }
        stage("Build"){
            steps{
                echo "Build.."
            }
        }
    }
}