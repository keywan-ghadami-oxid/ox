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
        --volume $(pwd):/app \
        key-php-cli "$@"
}
```
## usage linux command line
```
ox composer info
```
