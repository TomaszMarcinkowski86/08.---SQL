## Import bazy filmów


0. Skopiuj cały folder `sakila` do ścieżki `C:\DB`
1. Otwieramy konsolę wpisując w pasek start `cmd`
2. Przechodzimy do lokalizacji folderu employees poleceniem:
```
cd c:\DB\sakila
```
3. Następnie wykonujemy import danych poprzez wpisanie:
```
mysql -u root -p < sakila-mv-schema.sql
mysql -u root -p < sakila-mv-data.sql
```
powinniśmy zostać zapytani o hasło do root, to hasło które ustaliliśmy podczas instalacji

4. Pomyślnie zaimportowaliśmy bazę `Sakila`. Poniżej diagram ERD schematu tej bazy.
![.images/sakila-schema.png](.images/sakila-schema.png)

Źródło: [https://dev.mysql.com/doc/sakila/en/](https://dev.mysql.com/doc/sakila/en/)
