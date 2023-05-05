# create the schema
drop schema if exists CRM;
create schema CRM;
use CRM;

###########################################
# TIMEZONE
###########################################

CREATE TABLE timeZone(
    id INT NOT NULL AUTO_INCREMENT,
    abbreviation VARCHAR(2) NOT NULL,
    PRIMARY KEY(id)
);

##########################################
# COUNTRY
##########################################

CREATE TABLE country(
    id INT NOT NULL AUTO_INCREMENT,
    fullName VARCHAR(50) NOT NULL,
    abbreviation VARCHAR(2) NOT NULL,
    PRIMARY KEY(id)
);

########################################
# STATEPROVINCE
########################################

CREATE TABLE stateProvince(
  id INT NOT NULL AUTO_INCREMENT,
  countryId INT NOT NULL,
  fullName VARCHAR(50) NOT NULL,
  abbreviation VARCHAR(2) NOT NULL,
  FOREIGN KEY(countryId) REFERENCES country(id),
  PRIMARY KEY(id)
);

##########################################
# USER 
##########################################

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL UNIQUE,
  password VARCHAR(500) NOT NULL,
  PRIMARY KEY(id)
);

-- bijection exists, fk can be used as pk
CREATE TABLE userFLnames (
  id INT NOT NULL,
  fName VARCHAR(45) NOT NULL,
  lname VARCHAR(45) NOT NULL,
  timezoneId INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(id) REFERENCES user(id),
  FOREIGN KEY(timezoneId) REFERENCES timeZone(id)
);

-- require users to have address, name, method of contact, etc
CREATE TABLE userInfo(
  id INT NOT NULL,
  stateProvinceId INT NOT NULL,
  city VARCHAR(50) NOT NULL,
  postalCode INT NOT NULL,
  streetName VARCHAR(45) NOT NULL,
  suite INT,
  PRIMARY KEY(id),
  FOREIGN KEY(id) REFERENCES user(id) ON DELETE CASCADE,
  FOREIGN KEY(stateProvinceId) REFERENCES stateProvince(id)
);

##########################################
# TERRITORIES 
##########################################

CREATE TABLE territories(
  id INT NOT NULL AUTO_INCREMENT,
  repId INT NOT NULL,
  stateProvinceId INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(repId) REFERENCES user(id),
  FOREIGN KEY(stateProvinceId) REFERENCES stateProvince(id)
);
