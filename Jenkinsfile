
pipeline {
    agent any

    tools {
        jdk 'java17'
        maven 'maven3'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/bhanutejasreejogi/java-project.git',
                    credentialsId: 'github-creds'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [
                    tomcat9(
                        credentialsId: 'tomcat-creds',
                        path: '',
                        url: 'http://98.84.31.69/:8080'
                    )
                ],
                contextPath: 'myapp',
                war: 'target/*.war'
            }
        }
    }
}
