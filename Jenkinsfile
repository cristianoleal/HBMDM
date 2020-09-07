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