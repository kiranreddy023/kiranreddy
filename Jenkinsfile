pipeline{
	agent any
	tools {
		maven "maven-3.6.3"
	}
	stages{
		stage("build"){
			steps{
				sh "mvn clean package -DskipTests=true"
			}
		}
		 stage("test"){
                        steps{
                                sh "mvn test"
                        }
                }
		 stage("Nexus Upload"){
                        steps{
				script{
                                	def pom = readMavenPom file: 'pom.xml'
					def version = pom.version
					nexusArtifactUploader artifacts: [[artifactId: 'Kiran', classifier: '', file: "target/Kiran-${version}.war", type: 'war']], 
					credentialsId: 'nexus', 
					groupId: 'in.kkrv', 
					nexusUrl: '52.66.241.61:8081/', 
					nexusVersion: 'nexus3', 
					protocol: 'http', 
					repository: 'kiranreddy', 
					version: "${version}"
				}
                        }
                }
		stage("docker build"){
                        steps{
                                sh "docker build -t kiran023/kiranreddy:v${env.BUILD_NUMBER} ."

                        }
                }
		stage("docker push"){
                        steps{
				withCredentials([usernamePassword(credentialsId: 'DockerHUB', passwordVariable: 'pswd', usernameVariable: 'uname')]) {
    // some block

                                sh "docker login -u ${uname} -p ${pswd}"
				sh "docker push kiran023/kiranreddy:v${env.BUILD_NUMBER}"
	                        }
			}
                }
        }
}
