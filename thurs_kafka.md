# Distributed Systems for Steam Processing
* Alena Hall working on Azure at Microsoft
* @lenadroid
* Apache Kafka and Spark Streaming
* Slides: Check OSCON slides

## What is Data?
* it's a side effect
* it is a continuous indicator

## Architecture
* Event Ingestion
  * Data producers and consumers. Is it flexible enough?
* Reaction
  * urgent (real time)
  * less urgent (near real time)
  * flexible (async)
* Challenges
  * simplicity, scalability and reliability

# Meet Apache Kafka
* open source stream processing
* written in Scala and Java
* allows publishing and subscribing
* scalability

## How Kafka works
* Brokers for topics
  * Distributed, immutable streams
  * key, value, timestamp
  * one topic can have many consumers
  * topics are partitioned
  * Kafka clusters connect producers and consumers
* Zookeeper
  * has data management, topics

# Spark Streaming
* open source unified analytics engine for large scale data processing, streaming, machine learning and more
* What can you do?
  * batch processing
  * machine learning
  * graph processing

## How does Spark work?
* it submits a job to a scheduler
* physical nodes are called workers. Workers execute tasks.
* The executor is a distributed agent.

# Set Up Example One
* Hosted on Azure
* Kafka Cluster
* Spark Cluster
* Peered Virtual Networks
* Public Sources of Data
* Azure Databricks portal (similar to Jupyter notebooks)
  * `shift + enter` to run code

## Processing Cryptocurrency Trading Data
* Markets, exchanges, trades
* Indicators to look for:
  * price spikes

### Get trade data
* 2400 Markets
* 11 exchanges
* getting all trades in batches

## Spark Side
* decompressing data into relevant columns
* running ML algo on this training data

## Consider your data sources
* internal or external
* you can have many data sources to analyze

# Example Two
* Send messages to slack channels based on whether feedback from Twitter and within Slack is positive or negative.
* Connect slack to stream messages in a channel looking for "azure"
* Set up Twitter Source
* Run sentiment analysis on these messages

# Continuous processing mode
* Latest Spark has `Trigger.continuous("1 second")`
  * low latency (less than 1ms)
  * not fully supported yet
  * needs a lot of cluster power
* as compared to micro batch processing
  * batch frequency
