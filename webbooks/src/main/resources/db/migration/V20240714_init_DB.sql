CREATE TABLE genres
(
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL UNIQUE
);

CREATE TABLE authors
(
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL UNIQUE,
    dateOfBirth DATE NOT NULL,
    dateOfDeath DATE,
    description varchar
);

CREATE TABLE books
(
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL UNIQUE,
    genre_id int NOT NULL REFERENCES genres(id) ON DELETE CASCADE,
    author_id int NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
    status varchar NOT NULL,
    description varchar,
    year int NOT NULL CHECK (year > 0 AND year < 2050)
);

CREATE TABLE clients
(
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL UNIQUE,
    age int NOT NULL CHECK (age > 0 AND age <= 150),  -- изменено на <= 150
    email varchar NOT NULL UNIQUE,
    sex varchar NOT NULL,
    phoneNumber varchar UNIQUE NOT NULL,
    deliveryAddress varchar,
    description varchar,
    favoriteGenre varchar
);

CREATE TABLE orders (
                        id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                        client_id int NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
                        book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE  -- убрано UNIQUE
);