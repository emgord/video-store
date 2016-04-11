CREATE TABLE customer (
  id serial primary key,
  name varchar(100),
  registered_at varchar(100),
  address varchar(100),
  city varchar(100),
  state varchar(100),
  postal_code varchar(5),
  phone varchar(15),
  account_credit float(16)
);

CREATE TABLE movie (
  id serial primary key,
  title varchar(100),
  overview varchar(255),
  release_date varchar(100),
  inventory integer
);

CREATE TABLE rental (
  id serial primary key,
  customer_id integer,
  movie_id integer,
  due_date date,
  cost float(16),
  returned boolean
);
