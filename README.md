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