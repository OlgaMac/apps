pipeline {
    agent any

    tools {
        maven "3.8.1"
    }

    environment {
        GITHUB_REPO_CRED = credentials("git-hub")
        GITHUB_REPO_OWNER = "OlgaMac"
        GITHUB_REPO_NAME = "apps"
        GITHUB_REPO_URL = "https://github.com/${GITHUB_REPO_OWNER}/${GITHUB_REPO_NAME}.git"
        VERSION = "1.0.${BUILD_NUMBER}" // global ENVs  ${YOUR_JENKINS_URL}/pipeline-syntax/globals#env
        MAVEN_REPO_PATH = "${WORKSPACE}/.m2/repository"
    }

    stages {
        stage('Build') {
            steps {
                dir('apps/webbooks') {
                    sh "mvn -B -DskipTests -Dmaven.repo.local=${MAVEN_REPO_PATH} -Dversion.application=${env.VERSION} clean package"
                }
            }
        }

        stage('Test') {
            steps {
                dir('apps/webbooks') {
                    sh 'mvn test'
                }
            }
        }

        stage('Upload') {
            steps {
                dir('apps/webbooks') {
                    sh "mvn -DskipTests -s settings.xml -Dmaven.repo.local=${MAVEN_REPO_PATH} -Dversion.application=${env.VERSION} deploy"
                }
            }
        }
    }

    post {
        success {
            dir('apps/webbooks') {
                junit 'target/surefire-reports/*.xml'
                archiveArtifacts 'target/*.jar'
            }
        }
    }
}