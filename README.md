# ApiFlask
 This is API TEST

## Build the image 

```

 docker build -t flask_api .

```
## Run container
```
 docker run -d -p 5000:5000 --name flask_api_test flask_api
```
## see logs

```
docker logs flask_api_test
```


## to test the API

go to browser and test localhost:5000 and see the logs of docker to check the http requests

## Connect node(go to download folder)

```
java -jar agent.jar -jnlpUrl http://localhost:8080/computer/localmachine/jenkins-agent.jnlp -secret 581d7fa35d42b58c5967faaefab762987879785fbb01b28e03acaf8e731b5d5c -workDir "C:\Users\armando.riosg\jenkins_node_local"
```
