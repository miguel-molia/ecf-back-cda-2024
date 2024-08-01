-- CREATE DATABASE - Créer une base de données
CREATE DATABASE mcdonaldsSouillac;


-- USE - Accéder à la base de données
USE mcdonaldsSouillac;

-- CREATE TABLE - Créer une table de données

-- Table des employés
CREATE TABLE employes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname TINYTEXT,
    lastname TINYTEXT,
    email TINYTEXT,
    password TINYTEXT
);

-- Table des clients
CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname TINYTEXT,
    lasname TINYTEXT,
    email TINYTEXT,
    password TINYTEXT
);

-- Table des articles
CREATE TABLE articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TINYTEXT,
    description TEXT,
    price FLOAT
);

-- Table des paniers
CREATE TABLE paniers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES clients(id)
);

-- Table des commandes
CREATE TABLE commandes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dateCommande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montantTotal FLOAT,
    clientId INT,
    isValidated BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (clientId) REFERENCES clients(id)
);


-- Table des articles dans les commandes (panier)
CREATE TABLE commandeArticles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantite INT,
    prix FLOAT,
    commandeId INT,
    articleId INT,
    FOREIGN KEY (commandeId) REFERENCES commandes(id),
    FOREIGN KEY (articleId) REFERENCES articles(id)
);


-- Table des articles dans les paniers
CREATE TABLE panierArticles (
   id INT PRIMARY KEY AUTO_INCREMENT,
    quantite INT,
    panierId INT,
    articleId INT,
    FOREIGN KEY (panierId) REFERENCES paniers(id),
    FOREIGN KEY (articleId) REFERENCES articles(id)
);
