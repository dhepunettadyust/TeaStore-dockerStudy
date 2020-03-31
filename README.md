# TeaStore-dockerStudy
To study docker multistage build and docker image functionality

 - `sudo docker network create teastore-Network`
 - `sudo docker run -p 3306:3306 -d --network teastore-Network --name teastore-db descartesresearch/teastore-db`





 - `sudo docker build -t dhepunettadyust/teastore-docker-study .`
 - `sudo docker run -p 8080:8080 --network teastore-Network --name teastore-docker-study dhepunettadyust/teastore-docker-study`
