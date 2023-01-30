FROM ubuntu:20.04
RUN apt-get -qq update && \
apt-get -qq install -y git && \
adduser --disabled-password --gecos "" --uid 1000 --shell /bin/bash jenkins && \
rm -rf /var/lib/apt/lists/*
RUN git config  --system user.email robot_acct@example.com && \
git config  --system user.name "Robot Account"