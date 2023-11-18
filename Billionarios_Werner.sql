CREATE DATABASE Billionaires_LW;
USE Billionaires_LW;

-- CREO TABLA LOCATIONS
CREATE TABLE IF NOT EXISTS locations(
	id INT AUTO_INCREMENT,
	citiCountry VARCHAR (50),
	region VARCHAR(35),
	state VARCHAR(50),
	city VARCHAR(60),
	latitude DECIMAL(9,6),
	longitude DECIMAL(9,6),
	PRIMARY KEY (id)
);

-- CREO TABLA BILLIONAIRES
CREATE TABLE IF NOT EXISTS billionaires (
    id INT AUTO_INCREMENT,
    id_location INT NOT NULL,
    placement INT,
    fullname VARCHAR(60) NOT NULL,
    firstName VARCHAR(30),
    lastName VARCHAR(30),
    gender VARCHAR(25),
    age INT,
    DOB DATE,
    BirthYear INT,
    BirthMonth INT,
    BirthDay INT,
    resCountry VARCHAR(50),
    industry VARCHAR (45),
    organization VARCHAR (45),
    status ENUM('d', 'u') DEFAULT 'd',
    source VARCHAR(50),
    selfMade BOOLEAN,
    finalWorth INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_billionaire FOREIGN KEY(id_location) REFERENCES locations(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA ECONOMICS
CREATE TABLE IF NOT EXISTS economics (
	id INT AUTO_INCREMENT,
	id_location INT NOT NULL,
	CPI DECIMAL(3,1),
	CPIChanges DECIMAL(3,1),
    GDP DECIMAL(3,1),
    tertiaryEducation DECIMAL(4,1),
    primaryEducation DECIMAL(3,1),
    lifeExpectancy DECIMAL(3,1),
    population INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_economics_billionaire FOREIGN KEY(id_location) REFERENCES locations(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA TAXES
CREATE TABLE IF NOT EXISTS taxes(
	id INT AUTO_INCREMENT,
	id_economic INT NOT NULL,
    totalTaxRate DECIMAL(3,1),
    taxRevenue DECIMAL(3,1),
	PRIMARY KEY (id),
    CONSTRAINT fk_taxes_economics FOREIGN KEY(id_economic) REFERENCES economics(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA BUSINESSES
CREATE TABLE IF NOT EXISTS businesses(
	id INT AUTO_INCREMENT,
	id_billionaire INT NOT NULL,
    organization VARCHAR(60),
    category VARCHAR(40),
    industry VARCHAR(30),
    title VARCHAR(60),
	PRIMARY KEY (id),
    CONSTRAINT fk_businesses_billionaire FOREIGN KEY(id_billionaire) REFERENCES billionaires(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA WEALTHS
CREATE TABLE IF NOT EXISTS wealths(
	id INT AUTO_INCREMENT,
	id_business INT NOT NULL,
    id_location INT NOT NULL,
    industry VARCHAR(30),
    source VARCHAR(50),
	PRIMARY KEY (id),
    CONSTRAINT fk_wealth_business FOREIGN KEY(id_business) REFERENCES businesses(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_wealth_location FOREIGN KEY(id_location) REFERENCES locations(id) ON DELETE RESTRICT ON UPDATE CASCADE
);