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
                echo "${DOCKER} or ${DOCKER_PSW} and ${DOCKER_USR}"
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

