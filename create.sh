sudo docker rm -f cloudc2docker
sudo docker build -t faithfulst3ward.dev/cloudc2docker .
sudo docker create --name=cloudc2docker --restart=always -p 2022:2022 -p 8080:8080 -e C2_PARAMETERS="-hostname c2.faithfulst3ward.dev" faithfulst3ward.dev/cloudc2docker
