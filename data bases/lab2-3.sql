use mydb;
select * from врачи;
select * from договора;

DELIMITER $$
DROP FUNCTION IF EXISTS count_doc_rows $$

create FUNCTION  count_doc_rows()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE row_num INT;
    SELECT count(id) INTO row_num FROM врачи;
    RETURN(row_num);
END$$

DROP FUNCTION IF EXISTS count_dog_rows$$
CREATE FUNCTION  count_dog_rows()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE row_num INT;
    SELECT count(*) INTO row_num FROM договора;
    RETURN(row_num);
END$$

DELIMITER ;

SELECT count_doc_rows();
SELECT count_dog_rows();

DELIMITER $$
DROP FUNCTION IF EXISTS setCont $$
create procedure setCont(num_contr int, date_contr text, sum_contr int, ID int, FIO text, Position text, CabinetNumber int, ReceiptTime text, ServiceForm text, Salary int, N_dog int)
begin
  declare idContr int default 0;
    select врачи.N_Dog into idContr from врачи
    join договора on (врачи.N_Dog=договора.N1_dog) where
    договора.N1_dog=num_contr;
    if(idContr=0) 
    then begin
    insert into договора values (num_contr, date_contr, sum_contr);
        insert into врачи values (ID, FIO, Position, CabinetNumber, ReceiptTime, ServiceForm, N_dog, Salary);
        select "Договор добавлен";
        end;
        else
        select("Данный контракт уже есть у врача");
        end if;
end$$
call setCont(1452, '2012-10-05', 2000, 100, 'Валиуллин Д.К.', 'ортопед', 101, '8:00-12:00', 'Ортопедическая', 5000, 1452)$$


select *from врачи$$


delimiter $$
DROP PROCEDURE IF EXISTS bigName4$$
CREATE PROCEDURE bigName4()
BEGIN 
    DECLARE id_p INT; DECLARE name_p TINYTEXT; 
  DECLARE is_end INT DEFAULT 0;
  DECLARE cur_p_name CURSOR FOR  
  SELECT id, concat(ucase(substring(position,1,1)),substring(position,2)) 
  FROM врачи; 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end=1; 
  OPEN cur_p_name; 
   wet: LOOP 
   FETCH cur_p_name into id_p, name_p; 
    IF is_end THEN LEAVE wet; 
    END IF; 
   UPDATE врачи SET position=name_p WHERE id=id_p; 
  END LOOP wet; 
  CLOSE cur_p_name; 
END$$
delimiter ;
CALL bigName4;
SELECT * FROM врачи;

#LAB3
select * from врачи;

DELIMITER //

CREATE TRIGGER restrict_empl BEFORE insert ON врачи 
   FOR EACH ROW 
BEGIN 
set new.Name =concat(upper(left(new.surname,1)), substring(new.surname,1)); 
set new.salary_hour= new.salary_hour*1.2; 
 
END//

select * from врачи;
select * from договора;

DELIMITER //

CREATE TRIGGER deltask AFTER delete ON врачи 
   FOR EACH ROW 
BEGIN 
   DELETE FROM договора WHERE N1_dog=old.N1_dog; 
END//