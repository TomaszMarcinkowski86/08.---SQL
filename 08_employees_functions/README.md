## Procedury i funkcje

Pierwsza funkcja
```
delimiter //

CREATE FUNCTION HelloWorld () RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	RETURN 'Hello World';
END
//
delimiter ;
```
* `DELIMITER //` - powoduje zastąpienie średnika `//`
* `DELIMITER ;` - na końcu powoduje, że średnik odzyskuje swoje dawne znaczenie

Wywołaj funkcję:
```
SELECT HelloWorld();
```

Pierwsza procedura:
```
CREATE PROCEDURE all_employees ()

SELECT * FROM employees;
//
delimiter ;
```
wywołanie procedury:
```
CALL all_employees;
```

08.01 Stwórz funkcje `yearsSince(dateFrom DATE)` zwracającą jako rezultat ilość lat które minęły od podanej daty.
Funkcję wykorzystaj aby wyświetlić dane o pracownikach i zamień dwa pola:
* birth_date - zamień na pole age wykorzystując w tym celu twoją funkcję `yearsSince`
* hire_date -  zamień na pole hiredAgo wykorzystując w tym celu twoją funkcję `yearsSince`

08.02 Stwórz funkcję pozwalającą na prezentację miesięcznych zarobków pracownika (dla przypomnienia, obecne dane w tabeli salaries zapisane są jako informacje roczne)

08.03 Stwórz funkcję prezentującą ilość lat zatrudnienia dla dwóch parametrów `from_date` i `to_date` z tabeli `dept_emp`
* 08.03.01 Niektóe wpisy w kolumnie `to_date` mają zapisaną wartość 9999-01-01 oznacza ona zatrudnienie na czas nieokreślony, dla takich dat chcielibyśmy aby funkcja prezentowała wartośc dla aktualnego roku

08.04 Stwórz procedurę o nazwie `employees_with_current_salaries()` prezentującą pracowników, z ostatnią wypłatą i tytułem. Pojedynczy wiersz powinien wyglądać jak poniżej:
```
10001	Senior Engineer	1953-09-02	Georgi	Facello	M	1986-06-26	60117	2002-06-22
```

08.:bulb: Kolej na Ciebie :thinking:, przygotuj 3 własne zagadki i zaproponowane rozwiązania.