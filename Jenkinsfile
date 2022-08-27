@Library("GitLib") _
pipeline{
    agent any

    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
        }

        stage("Dev-Deploy"){
            steps{
                //call(id,user,ip,war)
                deploy('Tomcat', "ec2-user", "123.123.101.139","Kiran-1.war")
            }
        }
        
        stage("QA-Deploy"){
            steps{
                //call(id,user,ip,war)
                deploy('Tomcat', "ec2-user", "123.123.116.33","Kiran-1.war")
            }
        }

        stage("Prod-Deploy"){
            steps{
                //call(id,user,ip,war)
                deploy('Tomcat', "ec2-user", "123.123.75.206","Kiran-1.war")
            }
        }

    }


}























'''pipeline{
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
                    
                    sh "ssh ec2-user@123.123.75.206 /opt/prod/bin/startup.sh"
                }
            }
           }
        }
    }'''
    
