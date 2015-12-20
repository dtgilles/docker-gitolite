# docker-gitolite
This gitolite (ssh) docker container is based on https://github.com/dtgilles/sshgw.
So you can use it to build a combined hopping station and git repository.

# status
This is currently a developer preview!

# configuration
This container introduces a new environment variable: Directory GIT_DATA hosts
all the repository data as well as private ssh keys (for mirror feature). It
should be on an external volume.

A typical setup would be:
* GIT_DATA     /data/git
* UserDir      /data/user
* HomeBase     /data/home
* HostKeys     /data/sshd_keys
whare /data mounted via --volumes-from option.

!Don't forget to backup /data!
