node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
       script{
        sh "docker build -t armando555/apiflask ."
       }
        app = docker.build("armando555/apiflask")
    }

    stage('Finish') {
          script {			
           sh "docker stop flask_api_test && docker rm flask_api_test "
        }
    }

    stage('Run container'){
          script {			
           sh "docker run -d -p 5000:5000 --name flask_api_test armando555/apiflask"
        }
    }

    
}
