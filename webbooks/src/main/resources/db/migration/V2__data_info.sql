INSERT INTO authors (id, name, dateOfBirth, dateOfDeath, description) VALUES
(1,'Джейн Остен', '1939', '1945', 'Информация о писателе.Информация о писателе.Информация о писателе.Информация о писателе.'),
(2,'Джордж Оруэлл', '1939', '1945', ''),
(3,'Фрэнсис Скотт Фицджеральд', '1939', '1945', 'Информация о писателе.Информация о писателе.Информация о писателе.Информация о писателе.'),
(4,'Луиза Мэй Олкотт', '1939', '1945', ''),
(5,'Маргарет Митчелл', '1939', '', ''),
(6,'Дж. Д. Сэлинджер', '1939', '', 'Информация о писателе.Информация о писателе.Информация о писателе.Информация о писателе.'),
(7,'Марк Твен', '1939', '1945', ''),
(8,'С. Л. Клайв', '1939', '', '');

INSERT INTO genres (id,name) VALUES
 (1,'Роман'),
 (2,'Антиутопия'),
 (3,'Драма'),
 (4,'Сатира'),
 (5,'Фэнтези'),
 (6,'Ужасы'),
 (7,'Комедия');

INSERT INTO books (id, name, genre_id, author_id, year,description, status) VALUES
(1,'Гордость и предубеждение', (SELECT id FROM genres WHERE name = 'Роман'), (SELECT id FROM authors WHERE name = 'Джейн Остен'), 1813, '', 'Свободна'),
(2,'1984', (SELECT id FROM genres WHERE name = 'Антиутопия'), (SELECT id FROM authors WHERE name = 'Джордж Оруэлл'), 1948, '', 'Свободна'),
(3,'Великий Гэтсби', (SELECT id FROM genres WHERE name = 'Драма'), (SELECT id FROM authors WHERE name = 'Фрэнсис Скотт Фицджеральд'), 1926, '', 'Свободна'),
(4,'Маленькие женщины', (SELECT id FROM genres WHERE name = 'Драма'), (SELECT id FROM authors WHERE name = 'Луиза Мэй Олкотт'), 1868, '', 'Взята'),
(5,'Унесенные ветром', (SELECT id FROM genres WHERE name = 'Драма'), (SELECT id FROM authors WHERE name = 'Маргарет Митчелл'), 1936, '', 'Свободна'),
(6,'Скотный двор', (SELECT id FROM genres WHERE name = 'Сатира'), (SELECT id FROM authors WHERE name = 'Джордж Оруэлл'), 1945, '', 'Свободна'),
(7,'Над пропастью во ржи', (SELECT id FROM genres WHERE name = 'Роман'), (SELECT id FROM authors WHERE name = 'Дж. Д. Сэлинджер'), 1951, '', 'Свободна'),
(8,'Приключения Гекльберри Финна', (SELECT id FROM genres WHERE name = 'Роман'), (SELECT id FROM authors WHERE name = 'Марк Твен'), 1884, '', 'Свободна'),
(9,'Хроники Нарнии', (SELECT id FROM genres WHERE name = 'Фэнтези'), (SELECT id FROM authors WHERE name = 'С. Л. Клайв'), 1950, '', 'Взята');

INSERT INTO clients (id, name, age, email, sex, phoneNumber,favoriteGenre, description) VALUES
(1,'Березнев Никита', 20, 'bernikcooldude@yandex.ru', 'Мужчина', '89031111112', '-', '-'),
(2,'Дин Норрис', 34, 'dnorris@yandex.ru', 'Мужчина', '89031111114', '-', '-'),
(3,'Мишель Томпсон', 16, 'mthompson@yandex.ru', 'Женщина', '89031111115', '-', '-'),
(4,'Дженнифер Лоуренз', 16, 'jlawrense@gmail.ru', 'Женщина', '89031111611', '-', '-'),
(5,'Скарлетт Йохансон', 16, 'scarlet@gmail.ru', 'Женщина', '89031111117', '-', '-'),
(6,'Крис Эванс', 35, 'kevans@gmail.ru', 'Мужчина', '89031111811', '-', '-'),
(7,'Хью Джекман', 20, 'hughy@gmail.ru', 'Мужчина', '89031111511', '-', '-'),
(8,'Мэтью Макконахи', 20, 'mattewmc@mail.ru', 'Мужчина', '89231111111', '-', '-');

INSERT INTO orders (id, client_id, book_id) VALUES
(1,(SELECT id from clients WHERE name = 'Хью Джекман'), (SELECT id from books WHERE name = 'Маленькие женщины')),
(2,(SELECT id from clients WHERE name = 'Хью Джекман'), (SELECT id from books WHERE name = 'Хроники Нарнии'));
