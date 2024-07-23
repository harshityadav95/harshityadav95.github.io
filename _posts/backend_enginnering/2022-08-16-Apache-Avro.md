---
title: Apache Avro ?
author: harshityadav95
date: 2022-08-16 00:00:00 +0530
categories: [Backend Engineering]
tags: [Web Development, Network]

---


![image](https://github.com/user-attachments/assets/5c7613ad-2c99-4a2a-9571-8088668fbef9)

## **A common problem in streaming applications**

- [**Kafka**](https://kafka.apache.org/) is a fast, scalable, durable, and fault-tolerant publish-subscribe messaging system that is widely adopted by enterprises.
- Kafka has the nature of [zero-copy](https://en.wikipedia.org/wiki/Zero-copy), which does not load data into memory and makes Kafka operate fast.
- **When Kafka gets data from a producer, it takes bytes as input and publishes them without parsing or even reading the data.**
- This zero-copy principle reduces the consumption of CPU and memory bandwidth, improving performance especially when the data volumes are huge.

![image](https://github.com/user-attachments/assets/831d0c21-944a-4023-9bb2-c3f18800fe9e)


- One of the major issues is that Kafka takes in bytes as input and publishes them, in this Kafka has no clue of what the data is and does not perform any kind of data verification to it.
- So if Kafka doesn't care, What if a producer sends in bad data, and what if a field is renamed or the data format for a field changes, in that case, the consumer might break when trying to read in data.
- The solution for this problem is to have a structure that is self describable and we need to be able to change data without breaking down consumers.

## What is Apache Avro?

- Avro is an open-source project that provides data serialization and data exchange services for Apache Hadoop.
- These services can be used together or independently.
- Avro facilitates the exchange of big data between programs written in any language. With the serialization service, programs can efficiently serialize data into files or into messages.
- The data storage is compact and efficient. Avro stores both the data definition and the data together in one message or file.
- Files that store Avro data should always also include the schema for that data in the same file.
- **Data is compressed with less CPU usage and can be read across over any language**
- Avro stores the data definition in JSON format making it easy to read and interpret; the data itself is stored in binary format making it compact and efficient.
- Avro files include markers that can be used to split large data sets into subsets suitable for [Apache MapReduce](https://www.ibm.com/analytics/hadoop/mapreduce) processing.
- Some data exchange services use a code generator to interpret the data definition and produce code to access the data. Avro doesn't require this step, making it ideal for scripting languages.
- A key feature of Avro is robust support for data schemas that change over time — often called schema evolution.
- Avro handles schema changes like missing fields, added fields and changed fields; as a result, old programs can read new data and new programs can read old data.
- Data stored using Avro can be passed from programs written in different languages, even from a compiled language like C to a scripting language like Apache Pig.

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

## **What just happen above ?**

It has some of the common fields often used while defining an avro schema :

- **name** : It is the name of your schema, here it was User
- **namespace** : It can also be called as the package name
- **doc** : Yes, you guessed it right, it is the documentation to explain your schema
- **aliases** : If you have any other option names for your schemas, you can use aliases
- **fields**
- **name** : The name of your field
- **doc** : documentation again
- **type** : The data type for that field
- **default** : You can provide a default value for that field using **default**

## What is Schema Registry?

![image](https://github.com/user-attachments/assets/896a8f07-a7bb-4ada-b872-0b39df294c6e)


- brokers do not parse or even read data and in return do not consume CPU resources.
- It also performs zero-copy meaning that it takes the input without even loading them into memory. Hence for all these reasons, we have the registry as a separate component.
- After introducing the schema registry, The producer will send Avro schema to the Schema Registry and the consumer will read the schema from the schema registry instead of reading the schema from Kafka.
- This will also reduce the size of the message being sent to Kafka.

## Avro File Format

![image](https://github.com/user-attachments/assets/7e687cea-cd0b-4f38-981c-4a6a2f421c74)


## Reference

- [https://www.ibm.com/topics/avro](https://www.ibm.com/topics/avro)
- [https://spark.apache.org/docs/2.4.5/sql-data-sources-avro.html](https://spark.apache.org/docs/2.4.5/sql-data-sources-avro.html)
- [https://medium.com/@knoldus/all-you-need-to-know-about-avro-schema-9f98ca1c1450#:~:text=Apache Avro is a data,deserialized by any other application](https://medium.com/@knoldus/all-you-need-to-know-about-avro-schema-9f98ca1c1450#:~:text=Apache%20Avro%20is%20a%20data,deserialized%20by%20any%20other%20application)
- [https://catherine-shen.medium.com/why-you-should-use-avro-and-schema-registry-for-your-streaming-application-2f24dcf017c8](https://catherine-shen.medium.com/why-you-should-use-avro-and-schema-registry-for-your-streaming-application-2f24dcf017c8)
- [https://simon-aubury.medium.com/kafka-with-avro-vs-kafka-with-protobuf-vs-kafka-with-json-schema-667494cbb2af](https://simon-aubury.medium.com/kafka-with-avro-vs-kafka-with-protobuf-vs-kafka-with-json-schema-667494cbb2af)
