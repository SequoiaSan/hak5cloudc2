# cloudc2docker
A Docker container for Hak5's Cloud C2.

## Built On
* Ubuntu 18.04.3
* Docker 18.09.8

## Setup

#### Step 1:
Clone this repository on a server with Docker.

#### Step 2:
Edit the create.sh file and set the hostname and any other parameters for Hak5's Cloud C2 into C2_PARAMETERS environment variable.

#### Step 3:
Build the container by running create.sh

#### Step 4:
Run start.sh to run the container

## Backup
To make a backup of your data, run the following command on your server:
```
sudo docker run --rm --volumes-from cloudc2docker -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /app
```
