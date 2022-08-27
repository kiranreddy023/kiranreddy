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
        stage("Deploy"){
            when{
                branch "develop"
            }
            steps{
                sshagent(['Tomcat']) {
                    // some block
                
                    
                    sh "scp -o StrictHostKeyChecking=no target/Kiran-1.war ec2-user@123.123.101.139:/opt/TOMCAT9/webapps"
                    sh "ssh ec2-user@123.123.101.139 mv target/Kiran-1.war target/develop.war"
                    sh "ssh ec2-user@123.123.101.139 /opt/TOMCAT9/bin/startup.sh"
                }
            }
            when{
                branch "qa"
            }
            steps{
                sshagent(['Tomcat']) {
                    // some block
                
                    
                    sh "scp -o StrictHostKeyChecking=no target/Kiran-1.war ec2-user@123.123.116.33:/opt/qa/webapps"
                    sh "ssh ec2-user@123.123.116.33 mv target/Kiran-1.war target/qa.war"
                    sh "ssh ec2-user@123.123.116.33 /opt/qa/bin/startup.sh"
                }
            }
            when{
                branch "master"
            }
            steps{
                sshagent(['Tomcat']) {
                    // some block
                
                    
                    sh "scp -o StrictHostKeyChecking=no target/Kiran-1.war ec2-user@123.123.75.206:/opt/prod/webapps"
                    sh "ssh ec2-user@123.123.75.206 mv target/Kiran-1.war target/master.war"
                    sh "ssh ec2-user@123.123.75.206 /opt/qa/bin/startup.sh"
                }
            }
        }
    }
    
}