sudo docker rm -f hak5cloudc2
sudo docker build -t sequoiasan/hak5cloudc2:0.0.2 .
sudo docker create --name=hak5cloudc2 -v cloudc2:/app --restart=always -p 2022:2022 -p 8080:8080 -e C2_PARAMETERS="-hostname c2.yourhostname.com" sequoiasan/hak5cloudc2:0.0.2
