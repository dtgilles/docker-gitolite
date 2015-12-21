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

| environment key | example value    | comment |
|:--------------- | :--------        | :------ |
| ```UserDir```   | ```/data/user``` | (see dtgilles/sshgw) |
| ```HomeBase```  | ```/data/home``` |(see dtgilles/sshgw) |
| ```HostKeys```  | ```/data/sshd_keys``` |(see dtgilles/sshgw) |
| ```GIT_DATA```  | ```/data/git```  | repository storage location |
| ```SSHD_OPTS``` | ```-e```         | additional options for ssh daemon (log to stdout) |
| ```SSH_KEY```   | ```ssh-rsa ...```| key of the first administrator (used for creation of admin repository) |
| ```EnableFeature```| ```D```       | features to enable (in this case "delete repositories"), see http://gitolite.com/gitolite/rc.html |
| ```DisableFeature```|```daemon gitweb```| features to disable, see http://gitolite.com/gitolite/rc.html |

where ```/data``` mounted via ```--volumes-from``` option. Per Default there is a Role named ```OWNERS``` that could be used to self-administer repository ownership. If you don't like that, you could disabling that extending ```DisableFeature``` list by ```OWNERS```.

**Don't forget to backup ```/data```!!**
