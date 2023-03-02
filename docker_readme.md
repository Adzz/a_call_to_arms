## Setup

```sh
docker build -t assembly .
docker run -t -d --name assemble assembly
docker exec -it assemble bash
```

## Teardown

```sh
docker stop assemble
docker rm assemble
docker rmi assembly
```
