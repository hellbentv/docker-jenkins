FROM ubuntu
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.549/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ADD run /usr/local/bin/run
RUN useradd -m jenkins

EXPOSE 8080
VOLUME ["/home/jenkins/.jenkins"]
CMD /usr/local/bin/run
