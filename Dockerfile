FROM jenkins/jenkins:lts

USER root

# add jenkins user
RUN mkdir /home/jenkins && chown jenkins:jenkins /home/jenkins && usermod -d /home/jenkins jenkins

# add docker group
ARG DOCKER_GROUP_ID
RUN groupadd -g ${DOCKER_GROUP_ID} docker && usermod -aG docker jenkins

# install docker, docker-compose
ENV DOCKER_VERSION 18.09.5
RUN curl -fL -o docker.tgz "https://download.docker.com/linux/static/test/x86_64/docker-$DOCKER_VERSION.tgz" && \
    tar --strip-component=1 -xvaf docker.tgz -C /usr/bin

RUN curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

USER jenkins
