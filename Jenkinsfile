pipeline{


   // agent { label 'java-docker-jnlp' }
   agent {

       docker {
            label 'docker'
            image 'python:3'
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

                sh 'python3 -m unittest adder.py'
            }
        }
        stage("Run Python"){
            
            steps{

                sh 'python3 adder.py 3 4'
            }
        }

        

    }

}
