pipeline {
    agent {
        docker {
            image 'crisaoleal/rubywd'
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Instalando as dependencias do projeto'
                sh 'bundle install'
                cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
            }
        }
        stage('Test') {
            steps {
                echo 'Executando os cenarios de teste'
                sh 'bundle exec cucumber -p ci'
            }
        }
    }
}