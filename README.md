# ox
docker container for php cli with composer and oxid cli support

# installation windows
(If you know how to use it in wndows please update this file by creating a pull request.)

# installation and usage in linux

## installation in linux
add this to your .bashrc
```
ox () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $HOME:$HOME \
        --volume $(pwd):/app \
        --volume $SSH_AUTH_SOCK:/ssh-agent \
        --env SSH_AUTH_SOCK=/ssh-agent \
         keywanghadamioxid/ox "$@"
}
```
## usage linux command line
```
ox composer info
```

## enable composer cache
```
mkdir /tmp/ox
```
and in your bashrc add the mount for the tmp folder by adding one
line into the ox definition in your .bashrc
```
        --volume /tmp/ox:/tmp \
```


