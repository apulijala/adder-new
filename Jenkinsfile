pipeline{


   // agent { label 'java-docker-jnlp' }
   agent {

       dockerfile {
            label 'docker'
       }
    }

    stages{
        
        stage ("Hello From Github") {
          echo "Hello From Github"
        } 

        stage("Compile"){
            
            steps{

                sh 'python3 -m compileall adder.py'
            }
        }

        stage("Unit Test") {
            steps{
                sh ''' python3 -m pytest \
                 -v --junitxml=junit.xml \
                 --cov-report xml --cov adder adder.py
                '''
            }
        }

        stage("Run Python"){
            
            steps{
                sh 'python3 adder.py 3 4'
            }

            post {
                always{
                    echo "====++++always++++===="
                    archiveArtifacts artifacts: 'coverage.xml', followSymlinks: false
                }
            }

           
        }
        

    }

}


