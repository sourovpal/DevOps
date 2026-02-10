# Database Load Balancing

### 1️⃣ Read / Write Split (সবচেয়ে বেশি ব্যবহার হয়)

👉 **Write → Primary DB**
👉 **Read → Replica DB(s)**

**কিভাবে কাজ করে**

* ১টা Primary DB (Insert, Update, Delete)
* একাধিক Read Replica (Select)

**Flow**

```
App
 ├─ Write → Primary DB
 └─ Read  → Replica 1 / Replica 2 / Replica 3
```

**Use case**

* ERP, CRM, E-commerce
* যেখানে Read বেশি, Write কম

**AWS Example**

* RDS MySQL + Read Replica
* App code / Proxy decide করে query কোথায় যাবে

---

### 2️⃣ Database Proxy ব্যবহার করে Load Balance

👉 Application সরাসরি DB তে না গিয়ে **Proxy** দিয়ে যায়

**Popular Proxy**

* **ProxySQL**
* **MySQL Router**
* **Amazon RDS Proxy**

**Flow**

```
App → DB Proxy → Primary / Replica
```

**Proxy কী করে**

* Read query → Replica
* Write query → Primary
* Connection pool manage করে
* Failover auto handle

✅ Best practice
❌ একটু extra setup লাগে

---

### 3️⃣ Multiple Read Replica + Round Robin

👉 একাধিক Replica এর মধ্যে **query ভাগ করে দেওয়া**

**Example**

```
SELECT → Replica1
SELECT → Replica2
SELECT → Replica3
```

**Load balancing strategy**

* Round Robin
* Least Connections
* Latency based

**কোথায় হয়**

* ProxySQL
* Application level logic
* Cloud DB service

---

### 4️⃣ Sharding (Horizontal Scaling)

👉 **Data ভাগ করে আলাদা আলাদা DB তে রাখা**

**Example**

```
User ID 1–1,000,000   → DB-1
User ID 1,000,001–2M → DB-2
```

**Use case**

* Facebook, Uber level scale
* Massive user base

✅ Huge scalability
❌ Complex logic, join কঠিন

---

### 5️⃣ Cluster-based Database (True Load Balancing)

👉 সব node **read + write** করতে পারে

**Examples**

* MySQL Galera Cluster
* PostgreSQL Citus
* CockroachDB

**Flow**

```
App → Load Balancer → DB Node 1 / 2 / 3
```

✅ Real load balancing
❌ Setup & maintenance heavy

---

### 6️⃣ Cloud Managed Load Balancing (Limited but Easy)

👉 Cloud নিজেই কিছুটা handle করে

**Examples**

* AWS Aurora (Reader Endpoint)
* Google Cloud Spanner

**Aurora Example**

```
Writer Endpoint → Write
Reader Endpoint → Auto LB Read
```

---

## কোনটা কখন ব্যবহার করবে?

| Scenario           | Best Way        |
| ------------------ | --------------- |
| Small / Medium App | Read Replica    |
| High Read Traffic  | Proxy + Replica |
| Very Large Scale   | Sharding        |
| Need HA + Scale    | Cluster DB      |
| Cloud Easy Setup   | Aurora          |

---

## Real Production Best Practice (Most Common)

👉 **Read Replica + Proxy (ProxySQL / RDS Proxy)**

```
App
 └─ Proxy
     ├─ Primary (Write)
     ├─ Replica 1 (Read)
     └─ Replica 2 (Read)
```
