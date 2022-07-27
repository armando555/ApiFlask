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

