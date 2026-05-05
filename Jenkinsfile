
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Taibanaz08/Library-Management-System.git'
            }
        }

        stage('Validate') {
            steps {
                bat '''
                if exist lib\\LibraryManagementSystem\\web\\index.html (
                    echo VALIDATION PASSED
                ) else (
                    echo FILE MISSING
                    exit /b 1
                )
                '''
            }
        }

        
         stage('Build Docker Image') {
            steps {
                bat 'docker build -t library-web .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat '''
                docker stop library-container 2>nul || exit /b 0
                docker rm library-container 2>nul || exit /b 0
                '''
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run -d -p 9091:80 --name library-container library-web'
            }
        }

        stage('Deploy') {
            steps {
                echo "Static site ready in build folder"
                bat 'dir build'
            }
        }
    }

    post {
        success {
            echo "SUCCESS 🚀"
        }
        failure {
            echo "FAILED ❌"
        }
    }
}