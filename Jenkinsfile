pipeline {
    agent any
    parameters {
      booleanParam(name: 'RUN_NPM_TEST', defaultValue: true, description: '')
    }
    stages {
        stage('Test') {
            when {
               expression { return params.RUN_NPM_TEST}
            }
            agent {
              docker {
                image 'node:latest'
              }
            }
            steps {
                sh "npm test --coverage"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker ps'
            }
        }
    }
}
