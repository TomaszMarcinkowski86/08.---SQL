## Date & Time

02.01 Wyświetl dzisiejszą datę
```
select sysdate();
```
02.02 Wyświetl aktualny rok:
```
select year(sysdate());
```
02.03 Wyświetl aktualny miesiąc:
```
select month(sysdate());
```
02.04 Wyświetl aktualny dzień:
```
select day(sysdate());
```
02.05 Alternatywnie:
```
SELECT curdate(), year(current_date()), month(current_date()), dayofmonth(current_date());
```