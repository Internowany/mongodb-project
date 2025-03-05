conn = new Mongo();
db1 = conn.getDB("database1");
db2 = conn.getDB("database2");
db3 = conn.getDB("database3");

db1.createCollection("users");
db1.createCollection("orders");
db1.createCollection("products");

db2.createCollection("logs");
db2.createCollection("sessions");

db3.createCollection("skills");

db1.users.insertMany([
  { name: "Alice", email: "alice@example.com" },
  { name: "Bob", email: "bob@example.com" },
  { name: "Charlie", email: "charlie@example.com" }
]);

db1.orders.insertMany([
  { user: "Alice", product: "Computer", price: 4200 },
  { user: "Bob", product: "Mobile", price: 1800 }
]);

db1.products.insertMany([
  { name: "Computer", stock: 11 },
  { name: "Mobile", stock: 22 }
]);

db2.logs.insertMany([
  { level: "INFO", message: "System started" },
  { level: "INFO", message: "Login successful" },
  { level: "ERROR", message: "Failed login attempt" }
]);

db2.sessions.insertMany([
  { user: "Alice", active: true },
  { user: "Bob", active: false }
]);

db3.skills.insertMany([
  { user: "Alice", skill: "cooking" },
  { user: "Bob", skill: "brewing" }
]);
