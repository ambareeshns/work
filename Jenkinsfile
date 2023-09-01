pipeline{
      agent any
//  environment {
//    DOCKERHUB_CREDENTIALS = credentials('docker-cred')
//    }
      stages{
            stage('check out'){
                  steps{
			sh "rm -rf testingrepo"
                        sh "git clone https://github.com/ambareeshns/testingrepo.git"					
                  }
            }
	      stage('Build'){
                  steps{	
			
                        sh "mvn package"				
                  }
            }
         stage('Image build'){
                  steps{	
			                sh "docker build -t namma-image:${BUILD_NUMBER} ."
                  }
            }  
     //  stage('Publish'){
    //              steps{	
    //            			sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
     //             }
     //      }  
	}
}
