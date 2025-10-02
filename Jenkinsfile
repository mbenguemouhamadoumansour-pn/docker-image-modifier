pipeline {
  agent any
  environment {
    GIT_REPO = 'https://github.com/mbenguemouhamadoumansour-pn/docker-image-modifier.git'
    EMAIL = 'mbenguemouhamadoumansour@gmail.com'
  }
  stages {
    stage('Clone Repo') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Identifiant githup', url: 'https://github.com/mbenguemouhamadoumansour-pn/docker-image-modifier.git']])
      }
    }
    stage('Docker Version Check') {
      steps {
        sh 'docker --version'
      }
    }
    stage('Build Image') {
      steps {
        sh 'docker build -t custom-node-image .'
      }
    }
  
  }
  post {
    failure {
      mail to: "${EMAIL}",
           subject: "❌ Jenkins Build Failed",
           body: "Le pipeline a échoué. Vérifie Jenkins pour plus de détails."
    }
  }
}
