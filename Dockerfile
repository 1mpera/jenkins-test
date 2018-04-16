FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y libltdl7 && rm -rf /var/lib/apt/lists/*

COPY jenkins-init.sh /usr/local/bin/

# User will be kept as root to modify permissions on boot
CMD /usr/local/bin/jenkins-init.sh
