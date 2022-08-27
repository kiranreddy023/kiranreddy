pipeline{
    agent any
    stages{
        stage("Git Checkout"){
            steps{
                git credentialsId: '9eee4c0c-cafb-4ff0-8635-da93f0a87dda', url: 'https://github.com/kiranreddy023/kiranreddy.git'
            }
        }
        stage("Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Develop"){
			when{
				branch "develop"
			}
            steps{
				echo "this is develop"
			}
			
        }
		stage("qa"){
			when{
				branch "qa"
			}
            steps{
				echo "this is qa"
			}
			
        }
		stage("master"){
			when{
				branch "master"
			}
            steps{
				echo "this is master"
			}
			
        }
    }
    
}