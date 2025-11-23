pipeline {
  agent any

  environment {
    DOCKER_CREDS = 'dockerhub-creds'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Docker Login') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: DOCKER_CREDS,
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS')]) {

          sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
        }
      }
    }

    stage('Build & Push Image') {
      steps {
        sh './build.sh'
      }
    }

    stage('Deploy (master only)') {
      when {
        branch 'master'
      }
      steps {
        sh './deploy.sh'
      }
    }
  }

  post {
    always {
      sh 'docker logout || true'
    }
  }
}
