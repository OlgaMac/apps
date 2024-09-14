-- Индексы для таблицы genres
CREATE INDEX idx_genres_name ON genres(name);

-- Индексы для таблицы authors
CREATE INDEX idx_authors_name ON authors(name);
CREATE INDEX idx_authors_dateOfBirth ON authors(dateOfBirth);

-- Индексы для таблицы books
CREATE INDEX idx_books_name ON books(name);
CREATE INDEX idx_books_genre_id ON books(genre_id);
CREATE INDEX idx_books_author_id ON books(author_id);
CREATE INDEX idx_books_status ON books(status);
CREATE INDEX idx_books_year ON books(year);

-- Индексы для таблицы clients
CREATE INDEX idx_clients_name ON clients(name);
CREATE INDEX idx_clients_age ON clients(age);
CREATE INDEX idx_clients_email ON clients(email);
CREATE INDEX idx_clients_sex ON clients(sex);
CREATE INDEX idx_clients_phoneNumber ON clients(phoneNumber);
CREATE INDEX idx_clients_favoriteGenre ON clients(favoriteGenre);

-- Индексы для таблицы orders
CREATE INDEX idx_orders_client_id ON orders(client_id);
CREATE INDEX idx_orders_book_id ON orders(book_id);