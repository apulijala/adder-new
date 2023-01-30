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
                
                version_g = sh( script: "sh ./get-next-version.sh", returnStdout: true).trim()
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
                        docker_group=sh (script: "stat -c '%g' /var/run/docker.sock", returnStdout:true).trim()
                        echo "Docker Gorup is ${docker_group}"
                    }
                
            }

           
        }

        stage("Package, Test & Deliver"){
            agent {
                dockerfile {
                    label 'docker'
                    filename './cd-env.dockerfile'
                    args "-v /var/run/docker.sock:/var/run/docker.sock:rw --group-add ${docker_group} "

                }
            }
            steps{
                sh """
                export version_s=\$(cat ./version_f)
                echo \$version_s
                """
            }
            
        }

        

    }
 
}