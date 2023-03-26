pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3"
        jdk "JDK17"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/applecoleene/COMP367_LAB2_Q3.git'

                // Run Maven on a Unix agent.
                //sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                 bat "mvn clean compile"
            }
        }
    }
}
