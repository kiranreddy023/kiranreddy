pipeline{
    agent any
    stages{
               
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