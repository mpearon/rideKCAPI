CREATE DATABASE IF NOT EXISTS kcstreetcarapi;
CREATE TABLE IF NOT EXISTS routes(  
	route_id int NOT NULL PRIMARY KEY COMMENT 'Primary Key'
);
CREATE TABLE IF NOT EXISTS trips(  
	trip_id BIGINT NOT NULL PRIMARY KEY COMMENT 'Primary Key',
	route_id INT,
	service_id TEXT,
	trip_headsign TEXT,
	direction_id INT,
	block_id BIGINT,
	shape_id BIGINT,
	FOREIGN KEY (route_id) REFERENCES routes(route_id)
);
CREATE TABLE IF NOT EXISTS stops(
	stop_id BIGINT NOT NULL PRIMARY KEY COMMENT 'Primary Key',
	stop_code TEXT,
	stop_name TEXT,
	stop_desc TEXT,
	stop_lat DECIMAL,
	stop_long DECIMAL,
	zone_id BIGINT,
	stop_url TEXT,
	location_type INT,
	parent_station TEXT
);
CREATE TABLE IF NOT EXISTS times(
	stop_id BIGINT NOT NULL PRIMARY KEY COMMENT 'Primary Key',
	trip_id BIGINT,
	arrival_time TIME,
	departure_time TIME,
	stop_sequence INT,
	pickup_type INT,
	drop_off_type INT,
	FOREIGN KEY (trip_id) REFERENCES trips(trip_id)
);