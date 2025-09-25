pipeline {
    agent any

    environment {
        IMAGE_NAME = 'myapp:latest'
        CONTAINER_NAME = 'myapp-container'
        HOST_PORT = '8081'
        CONTAINER_PORT = '80'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'main', url: 'https://github.com/GayathriGit742/Jenkins-pipeline-for-cicd.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                // Use 'bat' because host is Windows
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Test') {
            steps {
                echo 'Running container for testing...'
                // Stop/remove previous container if exists
                bat "docker rm -f %CONTAINER_NAME% || exit 0"
                // Run container
                bat "docker run -d -p %HOST_PORT%:%CONTAINER_PORT% --name %CONTAINER_NAME% %IMAGE_NAME%"
            }
        }

        stage('Deploy') {
            steps {
                echo 'Application deployed successfully!'
                echo "Open your browser at http://localhost:%HOST_PORT%"
            }
        }
    }
}
