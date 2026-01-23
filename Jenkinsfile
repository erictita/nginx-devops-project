pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git branch: 'main', url: 'https://github.com/erictita/nginx-devops-project.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t admintita/nginx-custom:latest .'
      }
    }

    stage('Trivy Scan') {
      steps {
        sh 'trivy image admintita/nginx-custom:latest'
      }
    }

    stage('Checkov Scan') {
      steps {
        sh 'checkov -d .'
      }
    }
  }
}
