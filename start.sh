#!/bin/bash
docker run --rm --name jenkins \
	-p 80:8080 -p 50000:50000 \
	-v jenkins_home:/var/jenkins_home \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /usr/bin/docker:/usr/bin/docker \
	jenkins-docker-agent

