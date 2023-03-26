pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3"
        jdk "JDK17"
    }

    stages {
        stage("Check out") {
            steps {
            echo "current build_id is ${env.BUILD_ID}"
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/applecoleene/COMP367_LAB3_Q1.git'
            }
        }

        stage("Build Maven Project") {
            steps {
                bat 'mvn clean package'
            }
        }

        stage("Docker build") {
        	steps {
				script {
					def imageTag = "acduqu/dockermavenlab3:${env.BUILD_ID}"
                    def dockerfile = 'Dockerfile'
                    def artifact = 'target/dockermavenlab3.jar'
                    def appPath = '/usr/src/app'

                    docker.build(imageTag, "-f ${dockerfile} --build-arg artifact=${artifact} --build-arg appPath=${appPath} .")
                }
            }
        }

        stage("Docker Login") {
            steps {
                withCredentials([usernamePassword(credentialsId: '92615733-e231-4a47-ac25-8feb884d4227', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    bat "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                }
            }
        }

        stage("Docker push") {
               steps {
                   script {
                            bat "docker push acduqu/dockermavenlab3:${env.BUILD_ID}"
                }
            }
        }
    }
}