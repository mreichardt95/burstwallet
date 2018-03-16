pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('Check Node') {
      steps {
        isUnix()
      }
    }
    stage('Build') {
      steps {
        sh '''git pull

docker build .'''
      }
    }
  }
}