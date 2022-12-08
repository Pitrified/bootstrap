# after installing docker following
# https://docs.docker.com/engine/install/ubuntu/
# there could be some permission problems
# https://stackoverflow.com/a/54504083/2237151
sudo setfacl --modify user:$USER:rw /var/run/docker.sock
