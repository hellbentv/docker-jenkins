FROM ubuntu:latest
MAINTAINER Alan Bennett "alan@akb.net"

#RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install wget 
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get -y install jenkins

ENTRYPOINT exec su jenkins -c "java -jar /usr/share/jenkins/jenkins.war"
