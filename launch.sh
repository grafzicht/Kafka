printf "\nzookeeper.connect=${ZOOKEEPER_HOST}\n" >> /kafka/config/server.properties
exec /kafka/bin/kafka-server-start.sh /kafka/config/server.properties