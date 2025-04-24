# Ultron Streaming Application

This project sets up a real-time data streaming pipeline using Redpanda, MySQL, Debezium, and Kafka Connect. Changes in a MySQL database (`fabric`) are captured and streamed to Redpanda topics using Debezium.

---

## 🧰 Technologies Used

- **Redpanda** (Kafka-compatible streaming platform)
- **MySQL** (as the source database)
- **Kafka Connect** (for Debezium)
- **Debezium** (CDC tool for MySQL)
- **Docker Compose**

---

## 🚀 Getting Started

Follow the steps below to set up and run the application locally.

---

## ✅ Prerequisites

- Install Colima and Qemu using brew
- ```brew install colima```
- ```brew install qemu```
- ```brew install docker```
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## 🏗️ Follow the steps : 

- Clone the repo
```bash
git clone https://github.com/your-username/fabric-streaming.git
cd fabric-streaming
```

- To run the script :
```angular2html
./run.sh -- to start the docker compose file
```

- Use this to curl request to create Debezium connection
```angular2html
curl -i -X POST http://localhost:8083/connectors \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-d @kafka/connectors/fabric-mysql-connector.json
```
- Use this to curl request to check Debezium connection
```angular2html
curl -X GET http://localhost:8083/connectors/mysql-fabric-connector/status
```

- For logs use
```angular2html
docker compose up 
```
- Execute in the mysql container
```angular2html
docker exec -it fabric-mysql mysql -ufabric -pfabric fabric 
```
- Run any update/insert command
- You will be able to see the message in the logs

- To verify Redpanda is working
```angular2html
  docker exec -it redpanda rpk topic list
```