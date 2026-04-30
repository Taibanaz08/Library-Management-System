pipeline {
    agent any

    environment {
        DEPLOY_DIR = "C:\\inetpub\\wwwroot\\library-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Pulling latest code from GitHub...'
                checkout scm
            }
        }

        stage('Validate Project') {
            steps {
                echo 'Checking project structure...'

                // Basic validation (important in real CI)
                bat '''
                if not exist lib\LibraryManagementSystem\\web\\index.html (
                    echo ERROR: index.html missing!
                    exit 1
                )
                '''
            }
        }

        stage('Clean Workspace') {
            steps {
                echo 'Cleaning old build files...'
                deleteDir()
                checkout scm
            }
        }

        stage('Package Application') {
            steps {
                echo 'Creating deployment package...'
                
                bat '''
                mkdir build
                xcopy /E /I /Y * build\\
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                echo 'Deploying application...'

                bat '''
                if not exist "%DEPLOY_DIR%" mkdir "%DEPLOY_DIR%"
                xcopy /E /I /Y build\\* "%DEPLOY_DIR%"
                '''
            }
        }

        stage('Post Deployment Check') {
            steps {
                echo 'Verifying deployment...'

                bat '''
                dir "%DEPLOY_DIR%"
                '''
            }
        }
    }

    post {
        success {
            echo '🚀 Deployment SUCCESS - Library App is live!'
        }
        failure {
            echo '❌ Deployment FAILED - Check logs'
        }
    }
}