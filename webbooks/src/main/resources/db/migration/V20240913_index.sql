-- Индексы для таблицы genres
CREATE INDEX idx_genres_id ON genres(id);

-- Индексы для таблицы authors
CREATE INDEX idx_authors_id ON authors(id);

-- Индексы для таблицы books
CREATE INDEX idx_books_id ON books(id);

-- Индексы для таблицы clients
CREATE INDEX idx_clients_id ON clients(id);

-- Индексы для таблицы orders
CREATE INDEX idx_orders_client_id ON orders(client_id);
CREATE INDEX idx_orders_book_id ON orders(book_id);