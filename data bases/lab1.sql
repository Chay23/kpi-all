use mydb;
select * from doctors;
select * from dogovora;
delimiter $$

create procedure from_DB_doctors1 (IN var1 INT)
   begin
       SELECT * FROM doctors LIMIT var1; 
   end $$

delimiter $$

create procedure from_DB_servisename1 (IN var1 INT)
   begin
       SELECT * FROM servisename LIMIT var1; 
   end $$


delimiter $$

create procedure from_DB_patientslist1 (IN var1 INT)
   begin
       SELECT * FROM patientslist LIMIT var1; 
   end $$


delimiter $$

create procedure from_DB_dogovora1 (IN var1 INT)
   begin
       SELECT * FROM dogovora LIMIT var1; 
   end $$
delimiter $$;

call from_DB_servisename1(2)$$;
call from_DB_doctors1(2)$$;
call from_DB_patientslist1(2)$$;
call from_DB_dogovora1(2)$$;


delimiter $$

CREATE PROCEDURE high_price1 (OUT h_price INT)
	BEGIN
SELECT MAX(Зарплата) INTO h_price FROM doctors;
	END $$

CALL high_price1(@M)$$

SELECT IDВрача, ФИО, Должность, НомерКабинета, ВремяПриема, ВидОказываемыхУслуг, Зарплата from doctors where Зарплата=@M$$

DELIMITER $$

CREATE PROCEDURE price_case (INOUT no_project INT, IN price1 INT, IN value1 INT)
BEGIN
CASE
WHEN (price1>value1) 
      THEN (SELECT COUNT(id_project) INTO no_project 
    FROM projects  WHERE Зарплата>value1);
WHEN (price1<value1) 
       THEN (SELECT COUNT(id_project) INTO no_project 
       FROM projects WHERE Зарплата<value1);
ELSE (SELECT COUNT(id_project) INTO no_project 
    FROM projects WHERE Зарплата=value1);
END CASE;
END$$
DELIMITER $$

SELECT id_project, project_name, price from projects where Зарплата > value1 + 1; 

CALL price_case(@C,201);


/*select N_dog from mydb.doctors
where N_dog in (select N_dog from dogovora where D_dog 
between '2017-11-01' and '2017-11-02');

select N_dog from doctors
where N_dog = ANY (
Select N1_dog from dogovora 
where D_dog between '2017-11-01' and '2017-11-02');

select N_dog from doctors a
  where exists (
Select * from dogovora b 
where D_dog between '2017-11-01' and '2017-11-02'
and a.N_dog=b.N1_dog);

SELECT nameDoctor, salary FROM doctors
	WHERE salary <= ALL 
		(SELECT salary FROM doctors);

SELECT nameDoctor, Salary FROM doctors 
	WHERE Salary =  
		(SELECT MIN(Salary) FROM doctors);

SELECT N1_dog, SUM(S_dog) AS Dog_total 
FROM dogovora
	GROUP BY N1_dog;

SELECT N1_dog, SUM(S_dog) AS Dog_total 
FROM dogovora
	GROUP BY N1_dog
	HAVING COUNT(N1_dog)>=1;
    
SELECT N1_dog, SUM(S_dog) AS Dog_total 
FROM dogovora
	GROUP BY N1_dog
	HAVING COUNT(N1_dog)>=2;

SELECT CONCAT('Договор № ',
               CONVERT(N1_dog, CHAR), 
               ' на сумму ') AS Номер, 
       SUM(S_dog) AS Сумма FROM dogovora
GROUP BY N1_dog
UNION
SELECT 'ИТОГО: ', SUM(S_Dog) FROM dogovora ORDER BY 1;

SELECT nameDoctor, N_dog, D_dog  
FROM doctors a, dogovora b
		WHERE a.N_dog=b.N1_dog;

SELECT nameDoctor, N_dog, D_dog  
FROM doctors a JOIN dogovora b ON a.N_Dog=b.N1_Dog;

SELECT nameDoctor, N_dog, D_dog
FROM doctors a LEFT JOIN dogovora b ON     
a.	N_Dog=b.N1_Dog;

SELECT nameDoctor, N_Dog, D_dog  
	FROM doctors f, dogovora c;
*/

