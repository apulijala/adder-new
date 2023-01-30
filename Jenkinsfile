pipeline{
    agent none

    options {
        buildDiscarder(logRotator(numToKeepStr: '1000'))
    }

    environment {
        DOCKER=credentials('dockerhub-arvubd-userpass')
    }


    stages{
        stage("Get Next Version"){
            steps{
                echo "========executing A========"
            }
            
        }
    }
    
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}

