# Docker

```bash
docker build --build-arg UID=`id -u` --build-arg GID=`id -g` -t buildbox:stretch .
docker create -it -v $PWD/.conan:/home/user/.conan --name buildbox buildbox:stretch bash
docker start -i buildbox
```
