## Как запустить

перейти в папку mongo-sharding-repl

```shell
cd ./mongo-sharding-repl
```

Выполнить команду

```shell
docker compose up -d
```

перейти в папку scripts

```shell
cd ./scripts
```

## Инициализация: конфигурационного сервера, наборов реплик, роутера

Выполнить скрипт

```shell
./init.sh
```

## Добавление данных

Выполнить скрипт

```shell
./add_data.sh
```

## Вывод количества данных на шардах

Выполнить скрипты

```shell
./shard_1_counts.sh
```

```shell
./shard_2_counts.sh
```

## Таблица с данными

|Service|port|ip|volume|
|:-|:-:|-:|-:|
|configSrv|27017|173.17.0.5|config-data|
|shard1|27018|173.17.0.6|shard1-data|
|shard1_repl_1|27019|173.17.0.7|shard1-repl-1-data|
|shard1_repl_2|27020|173.17.0.8|shard1-repl-2-data|
|shard2|27021|173.17.0.9|shard2-data|
|shard2_repl_1|27022|173.17.0.10|shard2-repl-1-data|
|shard2_repl_2|27023|173.17.0.11|shard2-repl-2-data|
|mongos_router|27024|173.17.0.12||
|pymongo_api|8080|173.17.0.14||
