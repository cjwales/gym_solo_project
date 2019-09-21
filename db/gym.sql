DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_classes;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  membership VARCHAR(255)
);

CREATE TABLE gym_classes(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  start_time VARCHAR(255),
  max_capacity INT2
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  class_id INT8 REFERENCES gym_classes(id) ON DELETE CASCADE
);
