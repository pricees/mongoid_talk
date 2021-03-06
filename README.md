# Mongo Rapid Fire Talk! #

_I have a few branches that show some of examples of Mongoid code_


### Docs ###
[mongo](http://docs.mongodb.org/manual/core/introduction/)

[mongoid](docs: http://two.mongoid.org/docs/)


### Notes ###
Relational DBMS think ACID

Atomicity 
: Txn is "all or nothing"

Consistency 
: Stable state -> transaction -> stable state

Isolation 
: Concurrent txn acts as if done serially

Durability 
: Once txn occurs, state held, persists in event of power loss

NoSQL think CAP 

- Consistency (same data, all nodes)
- Availability (every request gets a response)
- Partition tolerance (every works despite message loss or system failure)

Cap Theorem
: Given a distributed system it is IMPOSSIBLE to simultaneously provide all
three, so choose 2 and run with it!

NoSQL field went with Availability and Partition tolerance (AP) .. or as I call it
"You get AP, no C...cool?"

Mongo's BSON is begat from JSON
- supports data types: integer, float, date, etcka
- stored in binary

Mongo's structure

- Documents are like rows
  - exclusively stating keys give you indexes, capping
  - variable keys give you free form documents
- Collections are like tables

Associations, two types:

Linked/referred objects
- Less size => less bandwidth
- No join
- No atomicity
- more writes
Thinkin' bout linkin', Mongo has no "join," thats strinkin'

Embedded Objects 
- Fold that associative record into its parent document. BOOM!
- don't live outside the collection they are embedded into
- may be returning lots of unneeded data (bandwidth)
- atomicity is only at the document level, so if thats your #1 concern that
  would be a good reason to use embedded
- cap on size: 16mb. "16mb is enough for anyone" You could you GridFS Api...

Horizontal Scalability to beat the band
- "Auto Sharding"
- No memory, i/o bound concerns
- Mongo shards, acts as a shield to distribute calls to respective shard
- If query contains a shard key, call goes to one shard (awesome!!), else all shards (unawesome)
- Application doesn't know nothing about whether its one big server or 1
  million little guys
- Uses config servers to meta data
- Shards in production have 3 servers, if the primary goes down, one of the data
  replicas is chosen in its stead.

Oplog: Replication stream
1. Update of data to primary
2. Data then written to op log
3. Replica's read log and update they own stuff
4. Replication Lag: Delay to replication
  - Long delay, more time data is out of sync
  - Short delay, more load on secondaries
  - Goldilocks: not too much load, not out of sync too long

Concurrency
- Blocks on write
- Concurrent reads
- 2.2 is a magic number
  - Before 2.2: Single write locked the MongoDB instance, including all shards
  - After 2.2: Single write locked one Mongo database instance, other writes are passed
    to other shard instances.

When to use this thang?

- Big Data
- Massive Writes! 
- Everythings a dang key-value store
- Flex data types (json okay?)
- Horizontal Scalability
- No joinage? Doh!
