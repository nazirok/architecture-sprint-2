echo "shard 2 primary"
docker compose exec -T shard2 mongosh --port 27021 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "shard 2 secondary 1"
docker compose exec -T shard2_repl_1 mongosh --port 27022 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "shard 2 secondary 2"
docker compose exec -T shard2_repl_2 mongosh --port 27023 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

