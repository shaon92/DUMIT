create or replace procedure riseSal
(
	p_id IN employees.employee_id%TYPE,
	p_prc IN number,
	p_empName OUT employees.last_name%TYPE,
	p_newSal OUT employees.salary%TYPE
)IS
BEGIN    
	update employees set salary = salary + salary* p_prc/100 where employee_id = p_id; 	
	select last_name,salary INTO p_empName,p_newSal from employees where employee_id = p_id;
END riseSal;
/

DECLARE
	v_id employees.employee_id%TYPE;
	v_prc number;
	v_empName employees.last_name%TYPE;
	v_newSal employees.salary%TYPE;
BEGIN
	riseSal(&v_id,&v_prc,v_empName,v_newSal);
	dbms_output.put_line('Name: '||v_empName||' Salary: '||v_newSal);
END;
/


