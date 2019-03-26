## Usage: How to use BOSCore CDT Docker image to build contracts 
- save [docker-compose.yml](./docker-compose.yml) file into path `~/boscdt/`
- call `cd ~/boscdt/`
- call `docker-compose up -d` to start the CDT docker
- call `docker-compose exec boscdt bash` will enter the docker container
- call `cd /data` will go into the host machine mounted path `~/boscdt/`
- call `exit` to exit the docker contrainer
- copy your contract folders into `~/boscdt/` 
- call `docker-compose exec boscdt bash` and `cd /data/` you will find you contract folders
- enjoy to compile the contracts


## DIY: How to build self BOSCore CDT Docker image
- modify the [Dockerfile](./Dockerfile) and add yourself commands
- call `docker build -t XXXX/boscdt:vx.x.x --build-arg branch=release/v2.0.x --build-arg symbol=BOS --no-cache .`
- maybe you should push your docker image by call `docker push XXXX/boscdt:vx.x.x`
- change [docker-compose.yml](./docker-compose.yml) `image` into `XXXX/boscdt:vx.x.x` 
- follow `Usage: How to use BOSCore CDT Docker image to build contracts` to use yourself docker image