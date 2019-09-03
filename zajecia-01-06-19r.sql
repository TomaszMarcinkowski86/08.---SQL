show databases;

use employees;

show tables;
SELECT * FROM current_dept_emp;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_emp_latest_date;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT * FROM employees where gender LIKE 'M';
SELECT * FROM employees where gender = 'F';
SELECT * FROM employees where last_name = 'Lortz';
SELECT * FROM employees where first_name = 'Mary';
SELECT * FROM employees where date(hire_date) >=' 1999-01-01';
SELECT * FROM employees where date(hire_date) >=' 1999-01-01' LIMIT 10;

SELECT * FROM employees ORDER BY birth_date ASC limit 30;

SELECT * FROM employees ORDER BY birth_date DESC limit 10;

SELECT first_name, Year(sysdate())-year((date(birth_date))) as Age FROM employees ORDER BY birth_date DESC limit 10;

select COUNT(YEAR(to_date)!=9999)as było ,COUNT(YEAR(to_date)=9999)as jest FROM dept_emp;
select COUNT(*) FROM employees.dept_emp where gender = 'F';

SELECT e.emp_no, first_name, last_name, gender, hire_date
FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
WHERE YEAR(hire_date) > 1995
AND t.title='Senior Engineer';

SELECT * FROM salaries;
SELECT * FROM employees;

                        -- 04 EMPLOYEES SALARIES

-- Znajdź największe wynagrodzenie.
SELECT max(salary) FROM salaries ;

-- Wypisz do kogo należy.
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no
WHERE s.salary IN (SELECT max(salary) from salaries);

-- Znajdź najmniejsze wynagrodzenie. Wypisz do kogo należy.
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no
WHERE s.salary IN (SELECT min(salary) from salaries);

-- Wyświetl imię i nazwisko pracownika w kolumnie zapisanej jako ‘rekin biznesu’ mężczyzn urodzonych po 1954 roku
Select birth_date, concat(first_name ,' ' , last_name) as rekin_biznesu 
from employees
WHERE year(birth_date)>1954 AND gender = 'M';

-- Policz ilu rekinów biznesu pracuje i zapisz wartość w kolumnie o takiej nazwie.
Select count(*) as rekin_biznesu from employees
where year(birth_date)>1954 and gender='M';

-- Minimalne wynagrodzenie dla danej płci
SELECT MIN(salary), e2.gender FROm salaries s2 
INNER JOIN employees e2 on s2.emp_no = e2.emp_no
GROUP BY e2.gender;

-- Wyświetlić mężczyznę i kobietę, którzy zarabiają najwięcej
SELECT  e.emp_no, e.first_name, e.Last_name, s.salary, e.gender FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no
WHERE s.salary IN (SELECT max(salary) FROM salaries s2 
INNER JOIN employees e2 on s2.emp_no = e2.emp_no 
GROUP BY e2.gender);

-- -- Wyświetlić mężczyznę i kobietę, którzy zarabiają najmniej
SELECT  e.emp_no, e.first_name, e.Last_name, s.salary, e.gender FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no
WHERE s.salary IN (SELECT MIN(salary) FROm salaries s2 
               INNER JOIN employees e2 on s2.emp_no = e2.emp_no
			   GROUP BY e2.gender);
               

SELECT  e.emp_no, e.first_name, e.Last_name, s.salary, e.gender FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no
WHERE s.salary IN (38623,
38786);

-- Wyświetl największe zarobki per rok wypłacanej pensji.
SELECT  e.emp_no, e.first_name, e.Last_name, s.salary, YEAR(s.from_date) FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no
WHERE s.salary IN (SELECT MAX(salary) FROm salaries s2 
                  INNER JOIN employees e2 on s2.emp_no = e2.emp_no
                  GROUP BY YEAR(s2.from_date));

-- Wyświetl zarobki, imie i nazwisko pracownika wraz płcią w formie jednej kolumny, którzy zarabiają powyżej 150000 w konstrukcjach z JOIN
SELECT s.salary, concat(e.first_name, ' ', e.last_name, ' ', e.gender) AS 'Dane Pracownika' FROM employees e
INNER JOIN salaries s on e.emp_no =s.emp_no
WHERE s.salary >= 150000;

-- Wyświetl zarobki, imię i nazwisko pracownika wraz płcią, którzy zarabiają pomiędzy 145000 a 150000
SELECT s.salary, concat(e.first_name, ' ', e.last_name, ' ', e.gender) AS 'Dane Pracownika' FROM employees e
INNER JOIN salaries s on e.emp_no =s.emp_no
WHERE s.salary >= 145000 AND s.salary<=150000;

 -- średnia pensja
SELECT AVG(Salary) FROM salaries;

-- osoby zarabiające poyżej średniej
SELECT concat(e.first_name,' ', e.last_name,' ',e.gender) AS Person, s.salary FROM employees e 
INNER JOIN salaries s on e.emp_no =s.emp_no
WHERE s.salary > (SELECT AVG(Salary) FROM salaries);

-- osoby zarabiające poyżej średniej
SELECT concat(e.first_name,' ', e.last_name,' ',e.gender) AS Person, s.salary FROM employees e 
INNER JOIN salaries s on e.emp_no =s.emp_no
WHERE s.salary < (SELECT AVG(Salary) FROM salaries);

-- Wyświetlić płeć, liczbę pracowników, średnie wynagrodzenie, sumę wynagrodzenia i maksymalne wynagrodzenie dla danej płci.
SELECT e.gender, COUNT(*) AS 'liczba pracowników',AVG(s.Salary)as 'średnia', MAX(s.salary) as 'maksymalna',  SUM(s.Salary) as suma from employees e
INNER JOIN salaries s on e.emp_no =s.emp_no
Group By( e.gender);

-- Wyświetl sumę zarobków danego pracownika na przestrzeni wszystkich lat.
SELECT concat(first_name, ' ' , last_name) AS Person, SUM(s.Salary) as suma FROM employees e 
INNER JOIN salaries s on e.emp_no =s.emp_no
GROUP BY last_name;

                         -- 05 EMPLOYEES TITLE

SELECT * FROM titles;
-- Policz ile osób pracuje na danym stanowisku (title)
SELECT title, count(*) as 'Licba zatrudnionch' FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
group by t.title;
-- LUB
select title, count(*)  from titles t
group by title;

-- Policz ile osób pracuje na danym stanowisku (title), gdzie min zatrudnienia to 2000 osob (HAVIG)
select title, count(*)  from titles t
group by title
having count(*) > 2000;

-- Policz ile kobiet i ile mężczyzn pracuje na danym stanowisku (title)
SELECT  title, count(*) as 'Licba zatrudnionch', e.gender FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
group by gender, title;

-- Policz ile kobiet i ile mężczyzn pracuje na danym stanowisku (title) gdzie max zatrudnienia to 100 osob
SELECT  title, count(*) as 'Licba zatrudnionch', e.gender FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
group by gender, title
HAVING count(*)<=100;

-- Na których stanowiskach pracuje więcej niż 100 000 osób? (HAVING)
select title, count(*)  from titles t
group by title
having count(*) > 100000;

-- Dla wszystkich skończonych okresów pracy (to_date < sysdate()) na danym stanowisku (title) 
-- wyświetl średnią ilość dni jaką ludzie przepracowali na danym stanowisku.
SELECT title, from_date, to_date, AVG(DATEDIFF(to_date, from_date)) AS 'number of days' FROM titles
WHERE to_date<sysdate()
GROUP BY title;

             -- 06_employees_modifications

-- Dodaj 250 pracowników do tabeli pracowników 
-- (wygenerwałem przy pomocy serwisu https://www.mockaroo.com/, dodałem i zostawiłem parę dla przykładu)
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
 values (1, '1991-07-08', 'Grannie', 'Leheude', 'M', '2013-06-18');
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
 values (2, '1990-12-19', 'Hermann', 'Gavigan', 'M', '2005-11-23');
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
 values (3, '1985-04-18', 'Bab', 'Dami', 'F', '2012-11-26');
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
 values (4, '1983-06-25', 'Cordie', 'Goodfellow', 'M', '2018-09-29');

Select * from employees
where last_name='GAJZLER'; -- sprawdzenei czy jest wsród dodanych

-- Dokonać operacji zmiany płci na kilku pracownikach
UPDATE employees
SET gender ='M', birth_date = date('1992-03-29')
WHERE emp_no=159;

UPDATE employees
SET gender ='F', birth_date=date('1986-01-24')
WHERE emp_no=154;  -- pozwala mi zmienić tylko po KEY column jakieś zabezieczenie

Select * from employees
where last_name='Marcinkowski'; -- sprawdzenei 

-- Dokonać odwrotnej operacji zmiany płci w celu przywrócenia danych pierwotnych
UPDATE employees
SET gender ='F'
WHERE emp_no=159;

UPDATE employees
SET gender ='M'
WHERE emp_no=154;  

Select * from employees
where last_name='Marcinkowski';

-- Wykorzystaj instrukcję DATEDIFF i TIMEDIFF Policz osoby ktore pracowaly mniej niz 30 dni na jednym stanowisku.
SELECT  title, count(*) as 'mniej niż 30 dni na stanowisku' FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
where Datediff(to_date, from_date)<30
group by title;

