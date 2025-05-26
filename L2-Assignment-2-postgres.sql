-- Active: 1733932584439@@127.0.0.1@5432@conservation_db@public
CREATE DATABASE conservation_db;

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    ranger_name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species (
  species_id SERIAL PRIMARY key,
  common_name VARCHAR(100) NOT null,
  scientific_name VARCHAR(200) not NULL,
  discovery_date DATE NOT NULL,
  conservation_status VARCHAR(80) NOT NULL
);

CREATE TABLE sightings (
  sighting_id SERIAL PRIMARY KEY,
  ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
  species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
  sighting_time TIMESTAMP NOT NULL,
  "location" VARCHAR(150) NOT NULL,
  notes TEXT
);