## Контейнер для PKIS2

- Сборка образа:

      docker build --build-arg USER=$USER --build-arg UID=`id -u` --build-arg GID=`id -g` -t buildbox11:pkis2 .
