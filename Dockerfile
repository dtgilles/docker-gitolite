FROM       dtgilles/sshgw
MAINTAINER dtgilles@t-online.de

RUN    apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq git \
    && rm -rf /var/lib/apt/lists/*


RUN    useradd -g ssh -u 1000 -m git \
    && su - git -c 'git clone https://github.com/sitaramc/gitolite' \
    && su - git -c 'mkdir bin && gitolite/install -ln'
##### this is developer version ==> checkout has to get fixed for production

##### this file is automatically sourced by entry script
COPY entry.add /entry.add.10-git-init.sh
