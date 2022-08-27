pipeline{
    agent any
    stages{
       
        stage("Dev-Deploy"){
            when{
                branch "develop"
            }
            steps{
                sshagent(['Tomcat']) {
                    // some block
                
                    sh "mvn clean package"
                    sh "scp -o StrictHostKeyChecking=no target/Kiran-1.war ec2-user@123.123.101.139:/opt/TOMCAT9/webapps"
                    sh "ssh ec2-user@123.123.101.139 mv target/Kiran-1.war target/develop.war"
                    sh "ssh ec2-user@123.123.101.139 /opt/TOMCAT9/bin/startup.sh"
                }
            }
        }


           stage("qa-Deploy"){

           when{
                branch "qa"
            }
            steps{
                sshagent(['Tomcat']) {
                    // some block
                
                    sh "mvn clean package"
                    sh "scp -o StrictHostKeyChecking=no target/Kiran-1.war ec2-user@123.123.116.33:/opt/qa/webapps"
                    sh "ssh ec2-user@123.123.116.33 mv target/Kiran-1.war target/qa.war"
                    sh "ssh ec2-user@123.123.116.33 /opt/qa/bin/startup.sh"
                }
            }
           }


           stage("Prod-Deploy"){
            when{
                branch "master"
            }
            steps{
                sshagent(['Tomcat']) {
                    // some block
                
                    sh "mvn clean package"
                    sh "scp -o StrictHostKeyChecking=no target/Kiran-1.war ec2-user@123.123.75.206:/opt/prod/webapps"
                    sh "ssh ec2-user@123.123.75.206 mv target/Kiran-1.war target/master.war"
                    sh "ssh ec2-user@123.123.75.206 /opt/prod/bin/startup.sh"
                }
            }
           }
        }
    }
    
