DROP TABLE classes;
DROP TABLE members;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  premium BOOLEAN
);

CREATE TABLE gym_classes(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  start_time VARCHAR(255),
  max_capacity INT2
);

CREATE TABLE members_in_classes(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  class_id INT8 REFERENCES gym_classes(id) ON DELETE CASCADE
);
