---
title: Avro Schema and Azure Schema Registry
author: harshityadav95
date: 2022-08-17 00:00:00 +0530
categories: [Backend Engineering]
tags: [Software Development, Azure]

---

## **A common problem in streaming applications**

- **When Kafka gets data from a producer, it takes bytes as input and publishes them without parsing or even reading the data.**
- This zero-copy principle reduces the consumption of CPU and memory bandwidth, improving performance especially when the data volumes are huge.

![image](https://github.com/user-attachments/assets/10a28172-fe1d-4941-9552-07c64865ecea)

- One of the major issues is that Kafka takes in bytes as input and publishes them, in this Kafka has no clue of what the data is and does not perform any kind of data verification to it.
- So if Kafka doesn't care, What if a producer sends in bad data, and what if a field is renamed or the data format for a field changes, in that case, the consumer might break when trying to read in data.
- The solution for this problem is to have a structure that is self describable and we need to be able to change data without breaking down consumers.

## What is Apache Avro?

- Avro is an open-source project that provides data serialization and data exchange services for Apache Hadoop.
- These services can be used together or independently.
- Avro facilitates the exchange of big data between programs written in any language. With the serialisation service, programs can efficiently serialize data into files or into messages.
- The data storage is compact and efficient. Avro stores both the data definition and the data together in one message or file.
- Files that store Avro data should always also include the schema for that data in the same file.
- **Data is compressed with less CPU usage and can be read across over any language**
- Avro stores the **data definition in JSON format making it easy to read and interpret; the data itself is stored in binary format making it compact and efficient.**
- A key feature of Avro is robust support for data schemas that change over time — often called **schema evolution.**
- Avro handles schema changes like missing fields, added fields and changed fields; as a result, old programs can read new data and new programs can read old data.

## Similar to Avro

- Avro is similar to Thrift, Parquet, Protobuf, ORC ..etc.

## How does it look like ?

- Here is an basic example of avro schema **user.avsc** with fields **first_name, last_name, age and automated_email.**

```xml
{
	"type": "record",
	"namespace": "com.example",
	"name": "User",
	"fields": [{
			"name": "first_name",
			"type": "string",
			"doc": "First Name of the User"
		},
		{
			"name": "last_name",
			"type": "string",
			"doc": "Last Name of the User"
		},
		{
			"name": "age",
			"type": "int",
			"doc": "Age of the User"
		},
		{
			"name": "automated_email",
			"type": "boolean",
			"default": true,
			"doc": "Indicaton if the user is subscribe to the newsletter"
		}
	]
}
```

## What is Schema Registry?

![image](https://github.com/user-attachments/assets/e86b8863-5cdb-498d-a3c1-ce15786757c3)

- brokers do not parse or even read data and in return do not consume CPU resources.
- It also performs zero-copy meaning that it takes the input without even loading them into memory. Hence for all these reasons, we have the registry as a separate component.
- After introducing the schema registry, The producer will send Avro schema to the Schema Registry and the consumer will read the schema from the schema registry instead of reading the schema from Kafka.

### **What is Kafka Schema Registry?**

Basically, for both **Kafka Producers** and **Kafka Consumers**, Schema Registry in Kafka stores Avro Schemas.

- It offers a RESTful interface for managing Avro schemas.
- It permits for the storage of a history of schemas that are versioned.
- Moreover, it supports checking schema compatibility for Kafka.
- Using Avro Schema, we can configure compatibility settings to support the evolution of Kafka schemas.

## What is Azure Schema Registry

![image](https://github.com/user-attachments/assets/e82af06f-f08c-4595-b0b8-d35d96444914)

- It  provides a simple governance framework for reusable schemas and defines relationship between schemas through a grouping construct (schema groups)
- With schema-driven serialization frameworks like Apache Avro, moving serialization metadata into shared schemas can also help with **reducing the per-message overhead**
- That's because each message won't need to have the metadata (type information and field names) as it's the case with tagged formats such as JSON.
- Having schemas stored alongside the events and inside the eventing infrastructure ensures that the metadata that's required for serialisation or de-serialization is always in reach and schemas can't be misplaced

### **Producer**

1. Kafka producer application uses `KafkaAvroSerializer` to serialize event data using the specified schema. Producer application provides details of the schema registry endpoint and other optional parameters that are required for schema validation.
2. The serializer looks for the schema in the schema registry to serialize event data. If it finds the schema, then the corresponding schema ID is returned. You can configure the producer application to auto register the schema with the schema registry if it doesn't exist.
3. Then the serializer prepends the schema ID to the serialized data that is published to the Event Hubs.

### **Consumer**

1. Kafka consumer application uses `KafkaAvroDeserializer` to deserialize data that it receives from the event hub.
2. The deserializer uses the schema ID (prepended by the producer) to retrieve schema from the schema registry.
3. The de-serializer uses the schema to deserialize event data that it receives from the event hub.
4. The schema registry client uses caching to prevent redundant schema registry lookups in the future.

## Reference

- [https://www.ibm.com/topics/avro](https://www.ibm.com/topics/avro)
- [azure-schema-registry-for-kafka/java/avro/src/main/java/com/microsoft/azure at master · Azure/azure-schema-registry-for-kafka · GitHub](https://github.com/Azure/azure-schema-registry-for-kafka/tree/master/java/avro/src/main/java/com/microsoft/azure)
- [Azure Schema Registry in Azure Event Hubs - Azure Event Hubs Microsoft Docs](https://docs.microsoft.com/en-us/azure/event-hubs/schema-registry-overview#what-is-azure-schema-registry)
- [Kafka, Avro Serialization, and the Schema Registry - DZone Big Data](https://dzone.com/articles/kafka-avro-serialization-and-the-schema-registry#:~:text=The%20Schema%20Registry%20provides%20a,evolution%20of%20schemas%20using%20Avro.)
- [https://spark.apache.org/docs/2.4.5/sql-data-sources-avro.html](https://spark.apache.org/docs/2.4.5/sql-data-sources-avro.html)
- [https://medium.com/@knoldus/all-you-need-to-know-about-avro-schema-9f98ca1c1450#:~:text=Apache Avro is a data,deserialized by any other application](https://medium.com/@knoldus/all-you-need-to-know-about-avro-schema-9f98ca1c1450#:~:text=Apache%20Avro%20is%20a%20data,deserialized%20by%20any%20other%20application)
- [https://catherine-shen.medium.com/why-you-should-use-avro-and-schema-registry-for-your-streaming-application-2f24dcf017c8](https://catherine-shen.medium.com/why-you-should-use-avro-and-schema-registry-for-your-streaming-application-2f24dcf017c8)
- [https://simon-aubury.medium.com/kafka-with-avro-vs-kafka-with-protobuf-vs-kafka-with-json-schema-667494cbb2af](https://simon-aubury.medium.com/kafka-with-avro-vs-kafka-with-protobuf-vs-kafka-with-json-schema-667494cbb2af)
- [azure-sdk-for-java/sdk/schemaregistry/azure-data-schemaregistry-apacheavro at main · Azure/azure-sdk-for-java · GitHub](https://github.com/Azure/azure-sdk-for-java/tree/main/sdk/schemaregistry/azure-data-schemaregistry-apacheavro)
