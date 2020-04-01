# TeaStore-dockerStudy
To study docker multistage build and docker image functionality

# Build

 - Clone this repository: `git clone -b SeperateContainer https://github.com/dhepunettadyust/TeaStore-dockerStudy.git`
 - Build registry Image: `sudo docker build -f Dockerfile-registry -t dhepunettadyust/teastore-registry .`
 - Build auth Image: `sudo docker build -f Dockerfile-auth -t dhepunettadyust/teastore-auth .`
 - Build image Image: `sudo docker build -f Dockerfile-image -t dhepunettadyust/teastore-image .`
 - Build recommender Image: `sudo docker build -f Dockerfile-recommender -t dhepunettadyust/teastore-recommender .`
 - Build persistence Image: `sudo docker build -f Dockerfile-persistence -t dhepunettadyust/teastore-persistence .`
 - Build webui Image: `sudo docker build -f Dockerfile-webui -t dhepunettadyust/teastore-webui .`

# Run

 - Create docker internal network: `sudo docker network create teastore-Network`
 - Start database: `sudo docker run -p 3306:3306 -d --network teastore-Network --name teastore-db descartesresearch/teastore-db`
 - Start registry: `sudo docker run -d --network teastore-Network --name registry dhepunettadyust/teastore-registry:alpine`
 - Start auth: `sudo docker run -d --network teastore-Network --name auth dhepunettadyust/teastore-auth:alpine`
 - Start image: `sudo docker run -d --network teastore-Network --name image dhepunettadyust/teastore-image:alpine`
 - Start recommender: `sudo docker run -d --network teastore-Network --name recommender dhepunettadyust/teastore-recommender:alpine`
 - Start persistence: `sudo docker run -d --network teastore-Network --name persistence dhepunettadyust/teastore-persistence:alpine`
 - Start webui: `sudo docker run -p 8080:8080 --network teastore-Network --name teastore-webui dhepunettadyust/teastore-webui`

