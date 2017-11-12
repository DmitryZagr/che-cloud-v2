# che-cloud-v2

## Components

  - traefik:v1.4.2
  - eclipse/che-server-multiuser:5.20.0
  - postgres:9.6
  - jboss/keycloak-openshift:3.4.0.Final

## Подготовка

Перед развертыванием системы запусите из корня проекта скрипт:

```sh
./prepare.sh
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

## Литература
#### Docker
[Развертывание сервисов через *.yml файлы](http://training.play-with-docker.com/traefik-load-balancing/)

[Типы labels в swarm](https://docs.docker.com/engine/reference/commandline/service_create/#specify-service-constraints-constraint)


#### Мониторинг
[Репозиторий](https://github.com/botleg/swarm-monitoring.git)

[Настройка сервисов мониторинга swarm кластера](https://habrahabr.ru/company/southbridge/blog/327670/)
