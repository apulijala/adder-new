pipeline{
    agent none
    options {
        buildDiscarder(logRotator(numToKeepStr: '1000'))
    }
     environment {
        DOCKER=credentials('dockerhub-arvubd-userpass')
    }

    stages{

        stage("Get Next Version") {
        agent {
            dockerfile {
                label 'docker'
                filename  'git.dockerfile'
            }
        }
        
        steps {
            
            script {
                
                version_g = sh( script: "./get-next-version.sh", returnStdout: true).trim()
                echo "Next Version is ${version_g}"
                sh "echo -n ${version_g} > version_f"
                sh "cat ./version_f"
                
            }
          }
       }

        stage("Get Docker Group") {
            agent {
                label 'docker'
            }
            steps{
                    script {
                        docker_group=sh (script: "./get-docker-group.sh", returnStdout:true).trim()
                        echo "Docker Gorup is ${docker_group}"
                    }
                
            }

           
        }

    }
 
}