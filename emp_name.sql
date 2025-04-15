-- 2. Write a PL/SQL code to display the employee name and his department id who gets the maximum salary. 
-- Use the concept of setting data variable type & size as that of table attributes.

Declare
    max_sal numeric(10,2);
    v_ename employee_21.emp_name%type;
    v_deptid employee_21.dept_id%type;
    v_empcount number(4);
Begin
    select max(emp_salary) into max_sal from employee_21;
    dbms_output.put_line('THe highest salary is '||max_sal);
    select count(emp_id) into v_empcount from employee_21 where emp_salary=max_sal;
    if v_empcount >1 then 
        dbms_output.put_line('There are '||v_empcount||' employees with '||max_sal);
    else
        select emp_name,dept_id into v_ename,v_deptid from employee_21 where emp_salary=max_sal;
        dbms_output.put_line('Employee name : '||v_ename);
        dbms_output.put_line('Department id : '||v_deptid);
    end if;
End;
/
