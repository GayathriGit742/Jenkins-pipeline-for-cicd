pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running simple test...'
                sh 'docker run --rm myapp:latest ls /usr/share/nginx/html'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the container...'
                sh '''
                    docker stop myapp-container || true
                    docker rm myapp-container || true
                    docker run -d --name myapp-container -p 8081:80 myapp:latest
                '''
            }
        }
    }
}
