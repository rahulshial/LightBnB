-- -----------------------------------------------------
-- Schema lightbnb
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS lightbnb;
-- -----------------------------------------------------
-- Schema lightbnb
-- -----------------------------------------------------
-- CREATE DATABASE IF NOT EXISTS lightbnb DEFAULT CHARACTER SET utf8;
-- 
USE lightbnb;
-- 
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;
DROP TABLE IF EXISTS rates CASCADE;
DROP TABLE IF EXISTS guest_reviews CASCADE;
-- 
-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
-- 
-- -----------------------------------------------------
-- Table properties
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  thumbnail_photo_url VARCHAR(255) NULL,
  cover_photo_url VARCHAR(255) NULL,
  cost_per_night INTEGER NOT NULL DEFAULT 0,
  parking_spaces INTEGER NOT NULL DEFAULT 0,
  number_of_bathrooms INTEGER NOT NULL DEFAULT 0,
  number_of_bedrooms INTEGER NOT NULL DEFAULT 0,
  country VARCHAR(255) NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE
);
-- 
-- -----------------------------------------------------
-- Table reservations
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  property_id INTEGER REFERENCES properties (id) ON DELETE CASCADE,
  guest_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);
-- 
-- -----------------------------------------------------
-- Table property_reviews
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties (id) ON DELETE CASCADE,
  reservation_id INTEGER REFERENCES reservations (id) ON DELETE CASCADE,
  rating SMALLINTEGER NOT NULL,
  message TEXT
);
-- 
-- -----------------------------------------------------
-- Table rates
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS rates (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  cost_per_night INTEGER NOT NULL,
  property_id INTEGER REFERENCES properties (id) ON DELETE CASCADE
);
-- 
-- -----------------------------------------------------
-- Table guest_reviews
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS guest_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  guest_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  reservation_id INTEGER REFERENCES reservations (id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL DEFAULT 0,
  message TEXT NOT NULL,
);
-- 