-- Миграция для создания таблицы genres
CREATE TABLE genres
(
    id                 int PRIMARY KEY,
    name              VARCHAR(255)      NOT NULL UNIQUE
);

-- Миграция для создания таблицы authors
CREATE TABLE authors
(
    id                int PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    dateOfBirth VARCHAR(10) NOT NULL,
    dateOfDeath VARCHAR(10),
    description TEXT
);

-- Миграция для создания таблицы books
CREATE TABLE books
(
    id                 int PRIMARY KEY,
    name               VARCHAR(255)      NOT NULL UNIQUE,
    genre_id INT NOT NULL REFERENCES genres(id) ON DELETE CASCADE,
    author_id INT NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
    status VARCHAR(50) NOT NULL,
    description TEXT,
    year INT NOT NULL CHECK (year > 0 AND year < 2050)
);

-- Миграция для создания таблицы clients
CREATE TABLE clients
(
    id                 int PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    age INT NOT NULL CHECK (age > 0 AND age < 111),
    email VARCHAR(255) NOT NULL UNIQUE,
    sex VARCHAR(10) NOT NULL,
    phoneNumber VARCHAR(15) UNIQUE NOT NULL,
    deliveryAddress VARCHAR(255),
    description TEXT,
    favoriteGenre VARCHAR(255)
);

-- Миграция для создания таблицы orders
CREATE TABLE orders
(
    id                 int PRIMARY KEY,
    client_id INT NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
    book_id INT NOT NULL REFERENCES books(id) ON DELETE CASCADE
);