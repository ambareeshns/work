pipeline{
      agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('ambinsdocker')
    }
      stages{
            stage('check out'){
                  steps{
			sh "rm -rf work"
                        sh "git clone https://github.com/ambareeshns/work.git"					
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
			sh "docker run -d -p 6060:8080 --name port namma-image:${BUILD_NUMBER}"
                  }
            }  
       stage('Publish'){
                  steps{	
                	sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
			sh "docker tag namma-image:${BUILD_NUMBER} ambinsdocker/work:${BUILD_NUMBER}"
			sh "docker push ambinsdocker/work:${BUILD_NUMBER}"
                  }
           }  
       stage('Deliver'){
                  steps{	
                	sh "docker pull ambinsdocker/work:${BUILD_NUMBER}"
			sh "docker rm -f port"
			sh "docker run -d -p 6060:8080 --name port namma-image:${BUILD_NUMBER}"
                  }
           }  
	}
}
