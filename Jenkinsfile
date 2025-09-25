pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "myapp:latest"
        REGISTRY = "your-dockerhub-username/myapp"  // Change this if pushing to Docker Hub
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out code from GitHub..."
                git branch: 'main', url: 'https://github.com/GayathriGit742/Jenkins-pipeline-for-cicd.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the Docker image..."
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                // Example: run a container and check if it starts
                sh '''
                docker run --name myapp_test -d $DOCKER_IMAGE
                docker ps -a
                docker stop myapp_test
                docker rm myapp_test
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying Docker image..."
                // Example: push to Docker Hub (make sure to login via Jenkins credentials)
                sh '''
                docker tag $DOCKER_IMAGE $REGISTRY:latest
                docker push $REGISTRY:latest
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Check the logs!"
        }
    }
}
