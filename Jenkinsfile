pipeline {
    agent {
        docker {
            image 'crisaoleal/rubywd'
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building or Resolve Dependencies!'
                sh 'bundler install'
            }
        }
        stage('Test') {
            steps {
                echo 'Running regression tests'
                sh 'blundler exec cucumber -p ci'
            }
        }
        stage('UAT') {
            steps {
                echo 'Wait for User Acceptance'
                input(message: 'Go to production?', ok: 'Yes')
            }
        }
        stage('Prod') {
            steps {
                echo 'WebApp is Ready :)'
            }
        }
    }
}