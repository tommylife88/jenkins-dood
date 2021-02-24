FROM jenkins/jenkins:lts

USER root

# add jenkins user
RUN mkdir /home/jenkins && chown jenkins:jenkins /home/jenkins && usermod -d /home/jenkins jenkins

# add docker group
ARG DOCKER_GROUP_ID_HOST
RUN groupadd -g ${DOCKER_GROUP_ID_HOST} docker && usermod -aG docker jenkins

# install docker, docker-compose
ENV DOCKER_VERSION 20.10.0
RUN curl -fL -o docker.tgz "https://download.docker.com/linux/static/test/x86_64/docker-$DOCKER_VERSION.tgz" && \
    tar --strip-component=1 -xvaf docker.tgz -C /usr/bin

ENV DOCKER_COMPOSE_VERSION 1.28.4
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

USER jenkins
