SHOW databases;
USE sakila;
SHOW tables;
SELECT * FROM actor;
SELECT * FROM actor_info;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM customer_list;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_list;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM nicer_but_slower_film_list;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM sales_by_film_category;
SELECT * FROM sales_by_store;
SELECT * FROM staff;
SELECT * FROM staff_list;
SELECT * FROM store;

-- 10.2.1 Podaj pełne dane aktorów mających na imię ‘Scarlett’
SELECT * FROM actor_info
WHERE first_name = 'Scarlett';

-- 10.2.2 Podaj pełne dane aktorów mających na nazwisko ‘Johansson’
SELECT * FROM actor_info
WHERE last_name = 'Johansson';

-- 10.2.3 Ile niepowtarzalnych nazwisk aktorów zawiera baza?
SELECT count(DISTINCT last_name) as number_of_unque_L_name FROM actor; 

-- 10.2.4 Które z nazwisk niepowtarzają się w bazie?
SELECT DISTINCT last_name from actor;

-- 10.2.5 Które z nazwisk potwarzają się więcej niż raz?
select last_name, count(*) as number_of_duplikates from actor 
GROUP BY last_name
 HAVING COUNT(*) > 1;

-- 10.2.6 Który aktor wystąpił w największej ilości filmów? Ile było to filmów?
SELECT  count(film_id) as number_of_films, a.first_name, last_name FROM film_actor fa
inner JOIN actor a on fa.actor_id = a.actor_id
GROUP BY fa.actor_id
order by number_of_films desc limit 1 ;

-- 10.2.7 Jaka jest średnia długość filmu w bazie?
SELECT avg(length) from film;

-- 10.2.8 Jaka jest średnia długość filmu w bazie per kategoria?
SELECT avg(length), category from film_list
GROUP BY category;

-- 10.2.9 Pobierz filmy z kategorii family
SELECT title, category from film_list
WHERE category ='family';

-- 10.2.10 Pobierz najchętniej wypożyczane filmy
SELECT * from film;

-- 10.2.11 Wyświetl ile piniędzy zarobił łącznie każdy ze sklepów
SELECT * from payment;
SELECT * from store;
SELECT * from film;

-- 10.2.12 Wyświetl miasto i kraj dla wszystkich sklepów
SELECT a.address , s.store_id ,m.city, k.country From store s
INNER JOIN address a on a.address_id=s.address_id
INNER JOIN city m ON m.city_id = a.city_id
INNER JOIN country k on m.country_id=k.country_id;


-- 10.2.13 Wyświetl informacje o kategoriach filmów i ich łącznych zyskach jakie wygenerowały
SELECT * FROM sales_by_film_category;

-- 10.2.14 Stwórz widok prezentujący powyższe dane z zadania 10.2.13
CREATE OR REPLACE VIEW xxx AS
SELECT * FROM sales_by_film_category;

Select *from xxx;
-- 10.2.15 Wyświetl wszystkich aktorów którzy w nazwisku posiadają litery LI


-- 10.2.16 Wykorzystując wbudowane funckje geometryczne typu ST_AS_TEXT(geo) i ST_X(geo), ST_Y(geo) wygeneruj gotowe dane do przeklejenia z tabeli danych adresowych, którą będzie można przekleić w serwisie http://dwtkns.com/pointplotter/
-- przykład formatu danych obsługiwanych w serwisie:
-- 6.6328266,46.5169343
-- 128.0449753,46.9804391
-- uwaga, kilka wpisów posiada błędne lokalizacje 0 0 , wyeliminujmy je