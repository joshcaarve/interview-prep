# INFO.md

## Service Mesh

### Retry logic

### Dynamic Tracing

trace each request

### Authentication Between Services internally / Ports

### Traffic Splits



## tcpdump
tcpdump -n host 1xx.13x.62.1 and port 22

## Load Balancing algorithms

### round robin

### weighted round robin

### Network Adress transalation

## Layer 4 vs Layer 7

## Reverse Proxy

# System design
https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/main/docs/img/architecture-diagram.png

## Pub/Sub
### pro
Scales w/ multiple receivers
great for microservices
loose coupling
works while clients not running

### cons
More complex system
Message delivery issues
Network


### load balancing
https://cloud.google.com/load-balancing/docs/load-balancing-overview
more servers available

### dns load balancing

one url maps to many ips
subnets 
/32 is a single ip address

## caching
Stuff that is read/write a lot can be cached.
Database servers are sometimes more likely to crash than app servers

memchace, redis, cassandra

## CDN
A content delivery network or content distribution network (CDN) is a system of computers containing copies of data, placed at various points in a network so as to maximize bandwidth for access to the data from clients throughout the network. A client accesses a copy of the data near to the client, as opposed to all clients accessing the same central server, so as to avoid bottleneck near that server.

Content types include web objects, downloadable objects (media files, software, documents), applications, real time media streams, and other components of internet delivery (DNS, routes, and database queries)

docs-cdn

*CDN is just a dedicated geolocalized cache* in a distributed network where all nodes host copies of all resources originating from any node.

## Database


### scaling
master slave
read only

horizonatal charting
mod
 
nosql


## Scaling
Horizonal
Veritical
Stateful vs stateless
Caching
Cookies
Uptime
3 9s, SLA


## no sql, mongodb, firebase

## api

### REST
get/people
also static to query

### Graphql
fetched by asking for a specific query

