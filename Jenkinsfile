pipeline{


   agent { label 'java-docker-jnlp' }

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