-- Active: 1733932584439@@127.0.0.1@5432@conservation_db@public
CREATE DATABASE conservation_db;

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
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


INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

DROP TABLE rangers;
DROP TABLE species;
DROP TABLE sightings;