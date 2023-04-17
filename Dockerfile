FROM ubuntu:latest

# install git 
RUN apt-get update && apt install -y git

RUN mkdir -m 700 /root/.ssh; \
  touch -m 600 /root/.ssh/known_hosts; \
  ssh-keyscan github.com > /root/.ssh/known_hosts
WORKDIR /app
RUN --mount=type=ssh,id=github git clone git@github.com:luansmartr/smartr-env.git
CMD ["ls", "smartr-env"]
