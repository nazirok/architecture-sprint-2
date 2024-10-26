echo "shard 1 primary"
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "shard 1 secondary 1"
docker compose exec -T shard1_repl_1 mongosh --port 27019 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "shard 1 secondary 2"
docker compose exec -T shard1_repl_2 mongosh --port 27020 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

