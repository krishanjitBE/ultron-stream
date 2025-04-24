package com.practo.fabricstreaming;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.listener.MessageListener;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.stereotype.Service;

@EnableKafka
@Service
public class KafkaConsumer {

  @KafkaListener(topics = "dbserver1.fabric.doctors", groupId = "debezium-consumer-group")
  public void listen(ConsumerRecord<String, String> record) {
    System.out.println("Received message: " + record.value());
  }
}
