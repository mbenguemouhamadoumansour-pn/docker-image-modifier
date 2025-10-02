pipeline {
  agent {
    docker {
      image 'node:18'
    }
  }
  environment {
    GIT_REPO = 'https://github.com/mbenguemouhamadoumansour-pn/docker-image-modifier.git'
    EMAIL = 'mbenguemouhamadoumansour@gmail.com'
  }
  stages {
    stage('Clone Repo') {
      steps {
        git url: "${GIT_REPO}", branch: 'main'
      }
    }
    stage('Build Image') {
      steps {
        sh 'docker build -t custom-node-image .'
      }
    }
    stage('Push to GitHub') {
      steps {
        sh '''
          git config --global user.email "${EMAIL}"
          git config --global user.name "Jenkins CI"
          git add .
          git commit -m "Image modifiée automatiquement"
          git push origin main
        '''
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
