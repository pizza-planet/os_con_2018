# Postgres on Kubernetes

* https://twitter.com/FuzzyChef
* https://jberkus.github.io
* Josh Berkus

## Agenda
* Intro
* Stateful Apps on K8s
* Tradeoffs
* Patroni (the glue)
* Inside the Container
* Deploying
* Management
* And More...

## Stateful Kubernetes

### In 1.0 K8s, we had `ReplicaSet`
  * a set of identical pods with a load balancer
  * we can scale them up and down with full replacement
* But this worked for stateless services... something is missing
* It had limits.
  * no reliable way to connect to one pod (ip addresses change)
  * or between pods
  * storage is shared and reused
  * pod identities are unstable
* leading to making it very hard to have a database cluster

### Secondly: StatefulSet
* Adding identity, routing and storage that persist
* Identity
  * names for each pod are sequentially numbered that boot in sequential order
* Routing
  * Load balancing routes to a whole set or to one pod
* Storage
  * Create persistent volumes (PVs)
  * Define persistent volume templates (PVTs)
  * At deployment, each pod gets a PV Claim (PCV)
  * PVCs are per-pod, do not get garbage collected in case it fails and you need to rescue those files
  * Scheduler tries to deploy pod to existing PVC
* What's missing in StatefulSets?
  * Cluster Roles like "master", "shards" and "replica"
  * This must be implemented in the database container itself and handled theres

### Thirdly: CRDs & Operators
* Customer Resource Definition - a "plugin".
* Operator - automation of apps, implemented as a CRD.
  * take everything a junior database admin would do and make it code instead
  * (or) take everything the Puppet manifest did, and make it a K8s Object

## Current Stack:
* "A database cluster managed by an operator implemented as a CRD running a StatefulSet on Kubernetes"

## TradeOffs
* Many Small Databases vs One Giant Database
  * Easier to schedule / update many instead of the one big one
* Simple Deployment vs Customized Deployment
  * standardized deployment tools to administer 1000s of servers are better
* DevOps Automation vs Shelling In
* Team Self-Service vs DBA Control
* Scaling Services vs Performance Tuning
* Automated HA vs Manual Failover

## Performance Penalties
* Overlay network latency
  * using a virtual network
* Storage abstraction
  * more abstracted, more latency
* Limits on large databases
  * problem at the Unix kernel level
  * cgroups memory management

## Paid Cloud Options
* RDS
* Postgres Aurora
* Google/Azure PostgresSQL

# Why K8s?
1. Portability
2. On-Premise Options if regulation requires it
3. Custom Postgres optionality of features / versions
4. $$$$ - RDS is super expensive

## Solutions
* Glue code between K8s and PG
* Patroni / Spilo
* Crunchy Postgres Operator
  * base deployment has 14 containers with specific purposes
  * full featured system for large databases
* Stolon
  * Re-implemented Patroni in Go
  * changed some architectural decisions

## Use Cases
* Zalando
  * Top fashion retailer on AWS Cloud
  * Self Service for devs with 1000s of Databases
* Python.org
  * Needed HA
  * bugs.python.com runs on OpenShift stack
  * cut down on RDS fees
  * Crunchy is too complicated for a small DB

# Patroni: 80% Solution
* works for small DBs
* Fully automated HA
* Availability first
* K8s Load Balancing
* AWS friendly
* What is it?
  * HA daemon in Python
* Spilo: container image containing Patroni, Postgres and utilities

## Patroni Daemon
* controls Postgres start/stop
* automates failover
* supplies management API
* Patroni is the elephant rider

## Why?
  * simplicity - one container with "just works" defaults
  * usability - management port at 8008, no limits on postgres
  * availability - full automated replication failover

## Deployments
* Create StatefulSet
* Create Endpoints
* Create Service
* Create Secret
* Create ServiceAccount with RBAC

# DEMO
* everything is in `/script` at `jberkus/pgKubernetesTutorial`
* Leader Election

### Failover
* master vanishes
* replica grabs the lock
* winner checks replication status
* appoints as new master
* k8s boots nodes to minimum scale again
