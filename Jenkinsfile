pipeline{
      agent any
      stages{
            stage('check out'){
                  steps{			
                        sh "rm -rf Maven"
                        sh "git clone https://github.com/anilpu3/Maven.git"					
                  }
            }
            stage('build'){
                  steps{
			
                        sh "pwd"
                        sh "ls"
                        sh "cd Maven"
		                  	sh 'mvn clean install -DskipTests'
                        sh "echo ${BUILD_NUMBER}"
                        sh "docker build -t namma-maven-image:${BUILD_NUMBER} ."
		 // sh "docker login --username admin --password-stdin < jfrog_paswrd http://54.242.56.226:8082/artifactory/namma-project/"
                  }
            }
	      stage ('Server') {
steps {
rtServer (
id: "Namma-Jfrog", //given in the jenkins system config in under Jfrog in Id field
// url: 'http://localhost:8082/artifactory',
url: 'http://54.209.43.160:8082/artifactory',
username: 'admin',
password: 'Iquadtech123',
bypassProxy: true,
timeout: 300
)
}
}

stage('Upload') {
steps{
rtUpload (
serverId: "Namma-Jfrog",
spec: '''{
"files": [
{
"pattern": "*.war"
"target": "namma-project/" ///repo created in Jfrog
}
]
}''',
)
}
}
	   /*   stage('j frog push'){
		      steps{
	     withCredentials([gitUsernamePassword(credentialsId: 'jfrog', gitToolName: 'Default'), usernamePassword(credentialsId: 'namma-jfrog-passwrd', passwordVariable: 'jfrog_user_password', usernameVariable: 'jfrog_user_name')]) {
   			sh "docker login -u  ${jfrog_user_name} -p ${jfrog_user_password} 'http://54.209.43.160:8082/artifactory'"
        
            		sh "docker push namma-maven-image:${BUILD_NUMBER}"
}
	      }	      
	      }	   */        
/*
stage ('Push image to Artifactory') { /// take that image and push to artifactory
        steps {
            rtDockerPush(
                serverId: "Namma-Jfrog",
                image: "namma-maven-image:${BUILD_NUMBER}",
               	targetRepo: 'namma-project', // wherera to copy to (from docker-virtual)
                // Attach custom properties to the published artifacts:
                properties: 'project-name=namma-project;status=stable'
            )
        }
    }
   */ 
}
}

