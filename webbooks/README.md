[//]: # (Todo: долго грузятся гиф)
# WebBooks 📚
Веб-приложение для библиотечной логистики, система контроля всех этапов работы цифровой библиотеки (работа с позициями 
а складе, менеджмент клиентов и прочее)

## Содержание

- [Запуск приложения](#start)
- [Реализованный функционал](#functions)
- [Архитектура приложения](#architecture)
- [Стек технологий](#tech)

<a name="start"></a>
## Запуск приложения

### Требования
**Сборка проверена на Ubuntu20.04**
* JDK17 [ссылка для скачивания](https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-17.0.1_linux-x64_bin.tar.gz) [пример установки на Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu)
* Maven3.2 [ссылка для скачивания](https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz) [пример установки на Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu)
* PostgreSQL12 [пример установки на Ubuntu 20.04](https://computingforgeeks.com/install-postgresql-12-on-ubuntu/)  
После установки PostgreSQL необходимо:
1. добавить пароль пользователю postgres
```bash
sudo -u postgres psql
ALTER USER postgres WITH PASSWORD 'new_password';
```
2. настроить postgres на прослушивание всех интерфейсов
```bash
vi /etc/postgresql/12/main/postgresql.conf
listen_addresses = '*'
sudo systemctl restart postgresql.service
```
3. создать базу данных в PostgreSQL
```bash
psql -h localhost -U postgres -W
# в интерфейсе psql
create database <DB_NAME>;
```
4. восстановить демо-данные в базе
```bash
sudo -u postgres psql <DB_NAME> < src/main/resources/V1__create_initial_tables.sql>
```

### Конфигурация базы данных для сборки в Maven

Файл конфигурации располагается по пути `src/main/resources/application.properties`

```java
DB.driver=Дравер_БД
DB.url=URL_БД
DB.user=Юзер
DB.password=Пароль
```
например:
```java
DB.driver=org.postgresql.Driver
DB.url=jdbc:postgresql://localhost:5432/<DB_NAME>
DB.user=postgres
DB.password=password
```
`src/main/resources/V1__create_initial_tables.sql` содержит демо-данные для БД.

<a name="functions"></a>

**WebBooks** - Spring Boot приложение, сборка осуществляется при помощи Maven.  
Собрать jar файл можно с помощью командной строки следующими командами:
```bash
cd webbooks
./mvnw package
```
Для запуска выполнить:
```bash
java -jar target/*.jar
```
Или вы можете запустить его из Maven напрямую, используя Spring Boot Maven plugin:
```bash
./mvnw spring-boot:run
```
После запуска приложение должно прослушивать порт TCP порт 8080:
```bash
sudo ss -tnlp
```
И доступно в браузере по http://<host_ip>:8080

## Реализованный функционал

- [раздел "Заказы"](#orders);
- [раздел "Жанры"](#genres);
- [раздел "Авторы"](#authors);

---

<a name=orders></a>

### Заказы

На странице книги, если книга свободна, появляется выпадающий список клиентов
и кнопка `Забронировать книгу`. Эта кнопка нажимается библиотекарем когда читатель хочет
забрать эту книгу. После нажатия на эту кнопку, книга начинает принадлежать выбранному клиенту и пояевляется в его списке книг.

_Книга свободна_

<img src="githubAssets/bookFree.png" alt="bookFree.png" width="800">

_Книга занята_

<img src="githubAssets/bookOrdered.png" alt="bookOrdered.png" width="800">

Страница, на которой отображается **таблица клиентов и книг**, которые они взяли. Все записи в
таблице кликабельны и ведут на соответствующие страницы. Кнопка `Освободить` нажимается библиотекарем тогда, когда читатель
возвращает книгу обратно в библиотеку. После нажатия на кнопку книга снова
становится свободной, пропадает из списка взятых клиентом книг. 

<img src="githubAssets/order1.gif" alt="order.gif" width="800">

---

<a name=genres></a>

### Жанры

1) **Страница со списком всех жанров**. Каждая строка кликабельна - при клике осуществляется переход на страницу жанра.
На странице расположена кнопка `Новый жанр` для создания нового жанра.

2) **Страница конкретного жанра**, на которой отображаются счетчик людей, добавивших данный
жанр в "свои любимые" и кликабельный список книг в библиотеке с данным жанром (книги, взятые клиентами
подсвечиваются красным цветом). Кнопки `Редактировать` и `Удалить жанр` перенаправляют на
соответствующие разделы

<img src="githubAssets/genresGeneral.gif" width="800" alt="genresGeneral.gif">

Если в библиотеке нет книг в данном жанре, вместо списка отображается
надпись _"Нет ни одной книги с этим жанром"_.

### Форма создания нового / редактирования существующего жанра. 

Поля валидируются с помощью `@Valid` и `Spring Validator` для отсутсвия повторяющихся записей

<img src="githubAssets/genresCreateEdit.png" width="800" alt="genresCreateEdit.png">

---

<a name="authors"></a>

### Авторы

1) **Страница со списком всех авторов**. Каждая строка кликабельна - при клике осуществляется переход на страницу автора.
   На странице расположена кнопка `Новый автор` для создания нового автора.

2) **Страница конкретного автора**, на которой отображается кликабельный список книг данного автора
Кнопки `Редактировать` и `Удалить автора` перенаправляют на соответствующие разделы.

Если не указывать дату смерти автора, то вместо нее появляется надпись _по настоящее время_.

Если не заполнять обязательные поля, рядом с ними появляется кнопка `Заполнить`.

<img src="githubAssets/author1.gif" alt="author1.gif" width="800">

### Форма создания нового / редактирования существующего автора.

Поля валидируются с помощью `@Valid` и `Spring Validator` для отсутсвия повторяющихся записей

<img src="githubAssets/authorsCreateEdit.png" alt="authorsCreateEdit.png" width="800">

--- 

<a name="architecture"></a>

## Архитектура приложения

При разработке использовался шаблон проектирования Model-View-Control

<img src="githubAssets/mvc.png" alt="githubAssets/mvc.png" width="800">


Взаимодействие с базой данных осуществляется при помощи шаблона Data Access Object

<img src="githubAssets/dao.png" alt="githubAssets/dao.png" width="800">


<a name="tech"></a>

## Стек технологий

Backend:
- Java
- Spring Boot, Spring MVC
- PostgreSQL, JdbcTemplate
- Maven
- Lombok
- Thymeleaf

Frontend:
- HTML 5
- Bootstrap 5

<a href="https://www.flaticon.com/free-icons/book" title="book icons">Icons created by Good Ware - Flaticon</a>
