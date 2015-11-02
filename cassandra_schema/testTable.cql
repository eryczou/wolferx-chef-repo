CREATE KEYSPACE wolferx
  WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
  
CREATE TABLE wolferx.test (
  test_id int,
  message Varchar,
  PRIMARY KEY (test_id)
);

INSERT INTO wolferx.test (test_id, message)
VALUES (1, 'CassandraTest: Passed');

SELECT *
FROM wolferx.test;