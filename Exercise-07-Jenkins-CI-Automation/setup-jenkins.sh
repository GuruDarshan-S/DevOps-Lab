#!/bin/bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
sleep 15
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
