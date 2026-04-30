
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

        stage('Build') {
            steps {
                bat '''
                mkdir build
                robocopy lib\\LibraryManagementSystem\\web build /E
                '''
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