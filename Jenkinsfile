pipeline {
    agent any

    tools {
        jdk 'JDK 21'
        maven 'Maven 3'
    }

    environment {
        // Unique docker compose project name per build to avoid container name conflicts
        COMPOSE_PROJECT_NAME = "week7_${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn -q clean package'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn -q test'
            }
        }

        stage('Docker Compose Up') {
            steps {
                bat "docker compose -p %COMPOSE_PROJECT_NAME% up -d --build"
            }
        }

        stage('Containers Running') {
            steps {
                bat "docker compose -p %COMPOSE_PROJECT_NAME% ps"
                bat 'docker ps'
            }
        }
    }

    post {
        always {
            // Bring down the SAME compose project we started
            bat "docker compose -p %COMPOSE_PROJECT_NAME% down --remove-orphans"
        }
    }
}