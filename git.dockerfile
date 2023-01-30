FROM ubuntu:20.04
RUN apt-get -qq update && \
apt-get -qq install -y git && \
adduser --disabled-password --gecos "" --uid 1000 --shell /bin/bash jenkins && \
rm -rf /var/lib/apt/lists/*
# RUN git config --add safe.directory /home/arvind/jenkins-adminstrator/chapter3/adder-new --system user.email robot_acct@example.com && \
# git config --add safe.directory /home/arvind/jenkins-adminstrator/chapter3/adder-new --system user.name "Robot Account"
