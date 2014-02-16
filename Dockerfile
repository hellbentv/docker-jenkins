FROM ubuntu:latest
MAINTAINER Alan Bennett "alan@akb.net"

#RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install wget 
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get -y install jenkins

ADD run /usr/local/bin/run

EXPOSE 8080
VOLUME ["/var/lib/jenkins"]
CMD /usr/local/bin/run
