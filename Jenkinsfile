pipeline{


   // agent { label 'java-docker-jnlp' }
   agent {

       dockerfile {
            label 'docker'
       }
    }

    stages{
        stage("Compile"){
            
            steps{

                sh 'python3 -m compileall adder.py'
            }
        }

        stage("Unit Test"){
            
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
        }

        post{
            always{
                junit 'junit.xml'
                cobertura  coberturaReportFile: 'covnerage.xml' 
            }
        }

        

    }

}
