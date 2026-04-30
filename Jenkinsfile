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
                robocopy . build /E /XD build
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                echo 'Deploying application...'

                bat '''
                C:\\xampp\\htdocs\\library-app mkdir C:\\xampp\\htdocs\\library-app
        robocopy build C:\\xampp\\htdocs\\library-app /E
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