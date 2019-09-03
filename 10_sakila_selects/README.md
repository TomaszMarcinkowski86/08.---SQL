## Szybkie rozpoznanie danych

![../09_sakila_import/.images/sakila-schema.png](../09_sakila_import/.images/sakila-schema.png)
[https://dev.mysql.com/doc/sakila/en/](https://dev.mysql.com/doc/sakila/en/)

1. Wykonaj po kolei wszystkie polecenia i przeanalizuj dane jakie są dostępne w bazie.
```
SHOW databases;
USE sakila;
SHOW tables;
```
```
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
```
10.2. Przygotuj odpowiednie zapytanie odpowiadające na następujące pytanie:
* 10.2.1 Podaj pełne dane aktorów mających na imię ‘Scarlett’
* 10.2.2 Podaj pełne dane aktorów mających na nazwisko ‘Johansson’
* 10.2.3 Ile niepowtarzalnych nazwisk aktorów zawiera baza?
* 10.2.4 Które z nazwisk niepowtarzają się w bazie?
* 10.2.5 Które z nazwisk potwarzają się więcej niż raz?
* 10.2.6 Który aktor wystąpił w największej ilości filmów? Ile było to filmów?
* 10.2.7 Jaka jest średnia długość filmu w bazie?
* 10.2.8 Jaka jest średnia długość filmu w bazie per kategoria?

10.:bulb: Kolej na Ciebie :thinking:, przygotuj 3 własne zagadki i zaproponowane rozwiązania.


