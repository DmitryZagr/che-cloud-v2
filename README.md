# che-cloud-v2

## Components

  - traefik:v1.4.3
  - eclipse/che-server-multiuser:5.20.1
  - jboss/keycloak-openshift:3.4.0.Final
  - paunin/postdock-pgsql:9.6
  - paunin/postdock-barman
  - osixia/docker-openldap-backup

#### Перед запуском


Скрипт для сборки docker-образа openldap:

```sh
 cd build/docker-openldap-backup
./build.sh
```

#### Запуск системы

```sh
docker-compose down && docker-compose up
```

#### Взаимодействие с системой

|сервис         | контекстный путь |
| ------------- | ---------------- |
| eclipse-che   | /                |
| keycloak      | /auth            |


## Настройка сервисов

#### eclipse-che

- В файле docker-compose пропишите в переменную окружения сервиса che **CHE_KEYCLOAK_AUTH__SERVER__URL** ваш public-IP:прокси http порт
**CHE_HOST** ваш public-IP
**CHE_IP** ваш public-IP
- Смена порта, через который eclipse-che будет доступен
  - В сервисе **traefik** отмаить http порт на желаемый порт хоста
  - В сервисе **che** изменить **CHE_PORT**, **traefik.port**, **TRAEFIK_PORT**, **CHE_KEYCLOAK_AUTH__SERVER__URL** на хостовый порт **traefik**
  - В сервисе **keycloak** изменить **CHE_REDIRECT_URIS**, **CHE_WEB_ORIGINS** на хостовый порт **traefik**

####  keycloak

- В файле docker-compose установите значения переменных окружения:
     - CHE_REDIRECT_URIS="<ваш public-IP>/*"
     - CHE_WEB_ORIGINS="<ваш public-IP>"

#### openldap
После развертывания системы необходимо запустить скрипт создания стандартных organization unit'ов в openldap:

```sh
./add_nodes.sh
```

#### Протестированное окружение
|ОС                 | docker                   |docker-compose       |
| ------------------| -------------------------|---------------------|
| Ubuntu 16.04.1 LTS| 17.06.2-ce, build cec0b72|1.16.1, build 6d1ac21|
| Ubuntu 16.04.1 LTS| 17.06.2-ce, build cec0b72|1.17.1, build 6d101fb|

#### Некорректные окружения
|ОС                 | docker                   |docker-compose       |Причина           |
| ------------------| -------------------------|---------------------|------------------|
| Ubuntu 16.04.1 LTS| 17.06.2-ce, build cec0b72|1.17.0               |баг docker-compose|

## Литература
#### Docker
[Развертывание сервисов через *.yml файлы](http://training.play-with-docker.com/traefik-load-balancing/)

[Типы labels в swarm](https://docs.docker.com/engine/reference/commandline/service_create/#specify-service-constraints-constraint)


#### Мониторинг
[Репозиторий](https://github.com/botleg/swarm-monitoring.git)

[Настройка сервисов мониторинга swarm кластера](https://habrahabr.ru/company/southbridge/blog/327670/)

#### Прокси
[Настройка меток traefik](https://docs.traefik.io/configuration/backends/docker/)
