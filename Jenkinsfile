pipeline {
  agent any
  stages {
    stage('build') {
      parallel {
        stage('build') {
          steps {
            echo 'build application'
          }
        }

        stage('test') {
          steps {
            echo 'testing application'
          }
        }

      }
    }

    stage('deploy') {
      steps {
        echo 'deploying application'
      }
    }

  }
}