#!/bin/bash

GID=$(ls -ln /var/run/docker.sock | awk '{ print $4 }')

# Create group wtih same gid if not exists
getent group $GID
if [[ "$?" == "2" ]]; then
  GROUP="docker-agent"
  groupadd $GROUP -g $GID
else
  GROUP=$(ls -la /var/run/docker.sock | awk '{ print $4 }')
fi

usermod -a jenkins -G $GROUP

chown -R jenkins:jenkins /var/jenkins_home 

su -c /usr/local/bin/jenkins.sh jenkins
