USE team_153;

/* ======================== ALIASES ===========================
   Aliases komutu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.
===============================================================*/

CREATE TABLE employees
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);

INSERT INTO employees VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM employees;

SELECT employee_id AS id , employee_name AS isim , employee_birth_city AS d_yeri
FROM employees;

SELECT employee_id id , employee_name isim , employee_birth_city d_yeri
FROM employees;

SELECT * FROM employees;