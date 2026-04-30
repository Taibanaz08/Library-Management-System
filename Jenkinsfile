
pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Pulling code from GitHub...'
                git branch: 'main',
                    url: 'https://github.com/Taibanaz08/Library-Management-System.git'
            }
        }

        stage('Validate Project') {
            steps {
                echo 'Checking project structure...'
                bat '''
                if not exist lib\\LibraryManagementSystem\\web\\index.html (
                    echo ERROR: index.html missing!
                    exit 1
                )
                '''
            }
        }

        stage('Clean Workspace') {
            steps {
                echo 'Cleaning build folder...'
                deleteDir()
                git branch: 'main',
                    url: 'https://github.com/Taibanaz08/Library-Management-System.git'
            }
        }

        stage('Package Application') {
            steps {
                echo 'Creating build folder...'
                bat '''
                mkdir build
                robocopy lib\\LibraryManagementSystem\\web build /E
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                bat '''
                echo Deployment done!
                dir build
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment SUCCESS ✅'
        }
        failure {
            echo 'Deployment FAILED ❌ check logs'
        }
    }
}