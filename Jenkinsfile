def COLOR_MAP = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']
pipeline {
    agent {
      docker {
        image "raphaelcastro35/gems_ruby"
      }
    }
    stages {
        stage("Build") {
            steps {
                sh "bundle install"
            }
        }
        stage("Tests") {
            steps {
                sh "bundle exec cucumber"
            }
            post {
                always {
                    cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
                    slackSend channel: "#jenkins", 
                        color: COLOR_MAP[currentBuild.currentResult],
                        message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n Mais informações acesse: ${env.BUILD_URL}"
                }
            }
        }
    }
}