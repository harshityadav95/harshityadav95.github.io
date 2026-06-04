---
title: "Getting Started with LogStash"
author: harshityadav95
date: 2018-05-24 00:00:00 +0530
categories: [Backend Engineering]
tags: [logstash, elk, logging, devops]
---

## Getting Started with LogStash

Use Of Data Log Analysis >[http://callistaenterprise.se/assets/presentationer/cadec-2015-elk.pdf](http://callistaenterprise.se/assets/presentationer/cadec-2015-elk.pdf)

Start Video Webinar (1hr) :[https://www.elastic.co/products/logstash](https://www.elastic.co/products/logstash)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-420a117c1b12.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-fd0d5e9419b7.png)

## What is the difference between Logstash and Beats?[edit](https://github.com/elastic/beats/edit/1.1/libbeat/docs/shared-faq.asciidoc)

Beats are lightweight data shippers that you install as agents on your servers to send specific types of operational data to Elasticsearch. Beats have a small footprint and use fewer system resources than Logstash.

Logstash has a larger footprint, but provides a broad array of input, filter, and output plugins for collecting, enriching, and transforming data from a variety of sources.

For more information, see the[Logstash Introduction](https://www.elastic.co/guide/en/logstash/current/introduction.html)and the[Beats Overview](https://www.elastic.co/guide/en/beats/libbeat/current/beats-reference.html).

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-17cb8c6ef688.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-8961bb2b6aed.png)

![Data Sources](/assets/img/posts/getting-started-with-logstash/medium-image-67cf7fe787f2.png)

_Data Sources_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-e4619cdfc3ff.png)

![Brief Architecture LogStash : Inputs](/assets/img/posts/getting-started-with-logstash/medium-image-c3bfeafdf7c8.png)

_Brief Architecture LogStash : Inputs_

![Filters](/assets/img/posts/getting-started-with-logstash/medium-image-9111666e428d.png)

_Filters_

![Data Output](/assets/img/posts/getting-started-with-logstash/medium-image-d4b23cccb477.png)

_Data Output_

![Resselient : Recover Easy from failure and maintian queue for processing](/assets/img/posts/getting-started-with-logstash/medium-image-05fb7b376145.png)

_Resselient : Recover Easy from failure and maintian queue for processing_

![Dynamic PipeLines](/assets/img/posts/getting-started-with-logstash/medium-image-1b9f4001c678.png)

_Dynamic PipeLines_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-3fa5c6f0ae84.png)

![Input from Port Beat (Datsource)](/assets/img/posts/getting-started-with-logstash/medium-image-1bbceb07d3e5.png)

_Input from Port Beat (Datsource)_

![What are we sending in Input](/assets/img/posts/getting-started-with-logstash/medium-image-310f2c514b26.png)

_What are we sending in Input_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-b487598f7433.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-d7359c08b5d7.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-f6becede8e0d.png)

What is a PipeLine:[https://medium.com/the-data-experience/building-a-data-pipeline-from-scratch-32b712cfb1db](https://medium.com/the-data-experience/building-a-data-pipeline-from-scratch-32b712cfb1db)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-f67813c292fe.png)

![2 Queues available in Logstash](/assets/img/posts/getting-started-with-logstash/medium-image-f831df8b2fe1.png)

_2 Queues available in Logstash_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-4a516272c264.png)

![Messages that are Undeliverable or cant be processed](/assets/img/posts/getting-started-with-logstash/medium-image-4911f8ff402f.png)

_Messages that are Undeliverable or cant be processed_

![Dead Letter Queue to handle and save and Handle Exception](/assets/img/posts/getting-started-with-logstash/medium-image-bc7e590afd21.png)

_Dead Letter Queue to handle and save and Handle Exception_

Setting Up

1. Create Data and setup in Beats to send data
2. in Config Stage setup set input and Map Filter and Clean Data and then send the data to Elastic Search

3) Send all data to ElasticSearch and Check data in Kibana

Link:[Documentation of Imp Files Inside inside the Logstash installation](https://www.elastic.co/guide/en/logstash/current/config-setting-files.html)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-e37096ae8f16.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-90e84abfda4c.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-7eb86bcdbbd2.png)

Search[https://comparisons.financesonline.com/microsoft-power-bi-vs-elasticsearch](https://comparisons.financesonline.com/microsoft-power-bi-vs-elasticsearch)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-2897c14465a8.png)

![Serialization and Deserialization](/assets/img/posts/getting-started-with-logstash/medium-image-bbd30b43b53b.png)

_Serialization and Deserialization_

![Using Codec to transform Json to Redis Events](/assets/img/posts/getting-started-with-logstash/medium-image-8be3f03e5b8c.png)

_Using Codec to transform Json to Redis Events_

![Encoding](/assets/img/posts/getting-started-with-logstash/medium-image-541d779ba14f.png)

_Encoding_

![Decoding](/assets/img/posts/getting-started-with-logstash/medium-image-35c86c8bfc6b.png)

_Decoding_

![Line Codec is Default](/assets/img/posts/getting-started-with-logstash/medium-image-4a5ef6fe5ed5.png)

_Line Codec is Default_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-8a7ac122c2b9.png)

![Grok Filter to Filter after Parsing](/assets/img/posts/getting-started-with-logstash/medium-image-78782197e1e7.png)

_Grok Filter to Filter after Parsing_

![Faster and Better Algorithm](/assets/img/posts/getting-started-with-logstash/medium-image-ff22fd1de9ae.png)

_Faster and Better Algorithm_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-5917c0f9c81d.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-d8676f82a630.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-bddcb7575ecc.png)

![Swiss Army Knife For Filtering](/assets/img/posts/getting-started-with-logstash/medium-image-0978c8c30e3f.png)

_Swiss Army Knife For Filtering_

![Example of Mutate Filter](/assets/img/posts/getting-started-with-logstash/medium-image-326c1bdd35cd.png)

_Example of Mutate Filter_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-2d1088e0b2b2.png)

![Enrich data](/assets/img/posts/getting-started-with-logstash/medium-image-e4064ae07bc0.png)

_Enrich data_

![Adding New Data to existing one](/assets/img/posts/getting-started-with-logstash/medium-image-89b466aac55c.png)

_Adding New Data to existing one_

![Custom Translation Mapping : Resolve Product Code but can be used in Querirs in Ealastic Search as well](/assets/img/posts/getting-started-with-logstash/medium-image-c90f4ab86db5.png)

_Custom Translation Mapping : Resolve Product Code but can be used in Querirs in Ealastic Search as well_

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-2a8bef98f684.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-6ced5c29de9c.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-1f7258725270.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-4708aff64412.png)

![Medium article image](/assets/img/posts/getting-started-with-logstash/medium-image-4339f68a42da.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/getting-started-with-logstash-96f5f1000cb6)
