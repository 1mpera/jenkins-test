pipeline {
    agent any
    parameters {
      booleanParam(name: 'RUN_NPM_TEST', defaultValue: true, description: '')
    }
    stages {
    stage('npm install'){
      agent {
          docker { 
	     image 'node:latest'
	     customWorkspace "$JENKINS_HOME/workspace/$BUILD_TAG"
	  }
      }
      steps{
	 sh "pwd"
         sh "npm install"
      }
    }

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
