-- Create database 'flowerpower' if it does not exist
CREATE DATABASE IF NOT EXISTS flowerpower;

-- Use database 'flowerpower'
USE flowerpower;

-- Create table 'medewerker'
CREATE TABLE medewerker(
  medewerkercode INT NOT NULL AUTO_INCREMENT,
  voorlettersmed VARCHAR(255) NOT NULL,
  tussenvoegselsmed VARCHAR(255),
  achternaammed VARCHAR(255),
  gebruikersnaam VARCHAR(255) UNIQUE NOT NULL,
  wachtwoord VARCHAR(255) NOT NULL,
  PRIMARY KEY(medewerkercode)
);

-- Create table 'klant'
CREATE TABLE klant(
  klantcode INT NOT NULL AUTO_INCREMENT,
  voorletters VARCHAR(255) NOT NULL,
  roepnaam VARCHAR(255) NOT NULL,
  tussenvoegsels VARCHAR(255) NOT NULL,
  achternaam VARCHAR(255) NOT NULL,
  adres VARCHAR(255) NOT NULL,
  postcode VARCHAR(6) NOT NULL,
  woonplaats VARCHAR(255) NOT NULL,
  geboortedatum DATE NOT NULL,
  gebruikersnaam VARCHAR(255) UNIQUE NOT NULL,
  wachtwoord VARCHAR(255) NOT NULL,
  PRIMARY KEY(klantcode)
);

-- Create table 'winkel'
CREATE TABLE winkel(
  winkelcode INT NOT NULL AUTO_INCREMENT,
  winkelnaam VARCHAR(255) NOT NULL,
  winkeladres VARCHAR(255) NOT NULL,
  winkelpostcode VARCHAR(6) NOT NULL,
  vestigingsplaats VARCHAR(255) NOT NULL,
  telefoonnummer INT(10) NOT NULL,
  PRIMARY KEY(winkelcode)
);

-- Create table 'artikel'
CREATE TABLE artikel(
  artikelcode INT NOT NULL AUTO_INCREMENT,
  artikel VARCHAR(255),
  prijs DECIMAL(10,2),
  PRIMARY KEY(artikelcode)
);

-- Create table 'bestelling'
CREATE TABLE bestelling(
  bestellingcode INT NOT NULL AUTO_INCREMENT, -- manually added
  winkelcode INT NOT NULL,
  artikelcode INT NOT NULL,
  aantal INT NOT NULL,
  klantcode INT NOT NULL,
  medewerkercode INT NOT NULL,
  PRIMARY KEY(bestellingcode),
  FOREIGN KEY(winkelcode) REFERENCES winkel(winkelcode),
  FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode),
  FOREIGN KEY(klantcode) REFERENCES klant(klantcode),
  FOREIGN KEY(medewerkercode) REFERENCES medewerker(medewerkercode)
);

-- Create table 'factuur'
CREATE TABLE factuur(
  factuurcode INT NOT NULL AUTO_INCREMENT,
  factuurdatum DATE,
  klantcode INT NOT NULL,
  PRIMARY KEY(factuurcode),
  FOREIGN KEY(klantcode) REFERENCES klant(klantcode)
);

-- Create table 'factuurregel'
CREATE TABLE factuurregel(
  factuurregelcode INT NOT NULL AUTO_INCREMENT,
  factuurcode INT NOT NULL,
  artikelcode INT NOT NULL,
  aantal INT NOT NULL,
  prijs DECIMAL(10,2),
  PRIMARY KEY(factuurregelcode),
  FOREIGN KEY(factuurcode) REFERENCES factuur(factuurcode),
  FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode)
);