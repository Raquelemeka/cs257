-- This SQL script creates a database schema for a Harry Potter-themed application.
-- It includes tables for characters, houses, wands, species, blood statuses,
-- potions, ingredients, spells, and their relationships.
-- Written by Rui Shen and Raquel Emeka on 04-29-2025

-- To load csv data into the tables, use \copy xxx FROM 'xxx.csv' DELIMITER ',' CSV NULL AS 'NULL' 
-- or \copy xxx FROM 'xxx.csv' DELIMITER ',' CSV HEADER

-- Characters-related tables
CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name TEXT,
    gender TEXT,
    job TEXT,
    house_id INTEGER REFERENCES houses(id),
    wand_id INTEGER REFERENCES wands(id),
    patronus TEXT,
    species_id INTEGER REFERENCES species(id),
    blood_status_id INTEGER REFERENCES blood_statuses(id),
    hair_color TEXT 
);

CREATE TABLE houses (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE wands (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE  
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE blood_statuses (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE  
);


CREATE TABLE characters_houses (
    character_id INTEGER REFERENCES characters(id),
    house_id INTEGER REFERENCES houses(id),
    PRIMARY KEY (character_id, house_id)
);

-- Potions-related tables
CREATE TABLE potions (
    id SERIAL PRIMARY KEY,
    name TEXT,
    effect TEXT,
    characteristics TEXT,
    difficulty_level TEXT
);


CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);


CREATE TABLE potions_ingredients (
    potion_id INTEGER REFERENCES potions(id),
    ingredient_id INTEGER REFERENCES ingredients(id),
    PRIMARY KEY (potion_id, ingredient_id)
);

-- Spells-related tables
CREATE TABLE spells (
    id SERIAL PRIMARY KEY,
    name TEXT,
    incantation_id INTEGER REFERENCES incantations(id),
    type_id INTEGER REFERENCES spell_types(id),
    effect_id INTEGER REFERENCES spell_effects(id),
    light TEXT
);


CREATE TABLE incantations (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE spell_types (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE spell_effects (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE 
);

-- We had to deal with duplicate ids because of 'Unknown' values in our dataset.
-- We modified the original incantation_types.csv so it contains no duplicate anymore, using a dup.py program that is not included here. 
--The incantation_types.csv in this directory is the one being modified and can be used to copy data to the table directly. 
CREATE TABLE incantation_types (
    incantation_id INTEGER REFERENCES incantations(id),
    type_id INTEGER REFERENCES spell_types(id),
    PRIMARY KEY (incantation_id, type_id)
);
