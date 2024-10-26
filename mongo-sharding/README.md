## Как запустить

перейти в папку mongo-sharding

```shell
cd ./mongo-sharding
```

Выполнить команду

```shell
docker compose up -d
```

перейти в папку scripts

```shell
cd ./scripts
```

## Инициализация: конфигурационного сервера, шардов, роутера

Выполнить скрипт

```shell
./init_config.sh
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

