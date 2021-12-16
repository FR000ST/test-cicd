pipeline {

  environment {
    dockerimagename = "fr000st91/test-cicd"
    dockerImage = ""
    mvn = "/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/apache-maven-3.8.4/bin/mvn"
	mvnCommand = " clean package"
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/FR000ST/test-cicd.git'
      }
    }
    
    stage('Build') {
      steps {
		script {
		  mvnCommand = mvn + mvnCommand
		}
        sh "echo $mvnCommand"
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhublogin'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yml", kubeconfigId: "kubernetes")
        }
      }
    }

  }

}
