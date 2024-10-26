echo "init mongo config"
docker compose exec -T configSrv mongosh --port 27017 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27017" }
    ]
  }
);
exit();
EOF

echo "init shard1 replica set"
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1:27018" },
        { _id : 1, host : "shard1_repl_1:27019" },
        { _id : 2, host : "shard1_repl_2:27020" }
      ]
    }
);
exit();
EOF

echo "init shard2 replica set"
docker compose exec -T shard2 mongosh --port 27021 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "shard2:27021" },
        { _id : 1, host : "shard2_repl_1:27022" },
        { _id : 2, host : "shard2_repl_2:27023" }
      ]
    }
);
exit();
EOF

echo "init mongo router"
docker compose exec -T mongos_router mongosh --port 27024 --quiet <<EOF
sh.addShard( "shard1/shard1:27018,shard1_repl_1:27019,shard1_repl_2:27020");
sh.addShard( "shard2/shard2:27021,shard2_repl_1:27022,shard2_repl_2:27023");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );
exit();
EOF