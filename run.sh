#!/bin/bash

echo "🔧 Starting Docker Containers ......"
docker-compose up -d

echo "⏳ Waiting for services to initialize (MySQL, Redpanda, Kafka Connect)..."
sleep 10

echo "Waiting for Kafka Connect to be ready..."
until curl --silent http://localhost:8083/; do
  echo "Waiting for Kafka Connect..."
  sleep 5
done
echo "Kafka Connect is ready."

echo "✅ Containers are up and running!"
echo "🗃️  MySQL:     localhost:3306 (user: fabric, pass: fabric)"
echo "🚀 Redpanda:  localhost:9092"
echo "🔗 Kafka Connect: http://localhost:8083"

echo "📦 Registering Debezium MySQL Connector..."
curl -i -X POST http://localhost:8083/connectors \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -d @kafka/connectors/fabric-mysql-connector.json

echo "✅ Connector registration request sent!"
