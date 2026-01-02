pipeline {
    agent any
    
    stages {
        stage('📥 Get Code') {
            steps {
                echo 'Getting latest code...'
                checkout scm
            }
        }
        
        stage('🔨 Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh 'docker build -t my-rails-app:latest .'
                }
            }
        }
        
        stage('🧪 Run Tests') {
            steps {
                echo 'Running tests...'
                script {
                    sh '''
                        docker run --rm my-rails-app:latest \
                        bundle exec rspec
                    '''
                }
            }
        }
        
        stage('🚀 Deploy') {
            steps {
                echo 'Deploying application...'
                script {
                    sh '''
                        # Stop old container if running
                        docker stop rails-app || true
                        docker rm rails-app || true
                        
                        # Start new container
                        docker run -d \
                          --name rails-app \
                          -p 3000:3000 \
                          my-rails-app:latest
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check the logs.'
        }
    }
}
```

### **.dockerignore** (tells Docker what to ignore)
```
log/*
tmp/*
.git
node_modules
