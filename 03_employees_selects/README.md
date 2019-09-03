## Pracownicy

03.01 Wyszukaj wszystkich pracowników?
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select * from employees;
```

</p>
</details>  

* 03.02 Wyszukaj wśród pracowników wszystkich mężczyczn.
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select * from employees where gender = 'M';
```

</p>
</details>

* 03.02.01 Wyszukaj wśród pracowników wszystkie kobiety.
* 03.02.02 Wyszukaj wśród pracowników wszystkich o nazwisku Lortz.
* 03.02.03 Wyszukaj wśród pracowników wszystkich o imieniu Mary.
* 03.02.04 Wyszukaj wśród pracowników wszystkich zatrudnionych 1 Stycznia 1991.

03.03 I ogranicz wyniki do 10
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select * from employees where gender = 'M' limit 10;
```

</p>
</details>  

03.04 Znajdź 30 najstarszych pracowników
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select * from employees order by birth_date limit 30;
```

</p>
</details>  

* 03.04.01 Znajdź 20 najmłodszych pracowników
* 03.04.02 Wyświetl ich z informacją o ich wieku zamiast daty urodzenia. (Ten blok może być przydatny [01_date_time/README.md](../01_date_time/README.md))
* 03.04.03 Znajdź 10 pracowników, którzy zostali zatrudnieni w firmie najdawniej.


03.05 Ile było i jest w firmie zatrudnionych pracowników?
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select COUNT(*) FROM employees.dept_emp;
```

</p>
</details>  

* 03.05.01 Ile było i jest w firmie zatrudnionych kobiet?
* 03.05.01 Ile było i jest w firmie zatrudnionych mężczyzn zatrudnionych po 2000 roku?


03.06 Ilu inżynierów ('engineer') pracuje obecnie w firmie (tabela titles)?
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select count(*) from employees e join titles t on e.emp_no = t.emp_no where title = 'Engineer'
```

</p>
</details>  

* 03.06.01 Ilu starszych inżynierów (tytuł Senior Engineer)

03.07 Policz wszystkich pracujących mężczyzn i kobiety.
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select gender ,count(*) as 'liczba pracownikow' from employees
group by gender;
```

</p>
</details>  

* 03.07.01 Dokonaj podobnego podziału na tytuł roli jaką wykonują i policz ilu pracowników było/jest zatrudnionych na danym stanowisku?
* 03.07.02 Teraz dokonajmy podobnego zapytania dla nazwisk i wypisać najpopularniejsze nazwiska osób zatrudnionych kiedykolwiek w firmie.

03.08  Policz wszystkich pracujących mężczyzn i kobiety urodzonych po 1960.
<details>
<summary>Rozwiązanie...</summary>
<p>

```sql
select count(*)'Pracowncicy urodzeni po 1960', gender
from employees
where year(birth_date) > 1960
group by gender;
```

</p>
</details>  

* 03.08.01  Policz wszystkich pracujących mężczyzn i kobiety zatrudnionych po 2000, zatrudnionych na stanowisku starszego inżyniera.


03.:bulb: Kolej na Ciebie :thinking:, przygotuj 3 własne zagadki i zaproponowane rozwiązania.