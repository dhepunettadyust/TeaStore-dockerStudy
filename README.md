# TeaStore-dockerStudy
To study docker multistage build and docker image functionality

# Build

 - Clone this repository: `git clone https://github.com/dhepunettadyust/TeaStore-dockerStudy.git`
 - Build Image: `sudo docker build -t dhepunettadyust/teastore-docker-study .`

# Run

 - Create docker internal network: `sudo docker network create teastore-Network`
 - Start database: `sudo docker run -p 3306:3306 -d --network teastore-Network --name teastore-db descartesresearch/teastore-db`
 - Start webapp: `sudo docker run -p 8080:8080 --network teastore-Network --name teastore-docker-study dhepunettadyust/teastore-docker-study`
