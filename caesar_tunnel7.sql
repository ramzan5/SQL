CREATE OR REPLACE FUNCTION prim(n integer) RETURN number IS
Begin
    for i in 2..n/2 loop
        if mod(n,i)=0 then
            return 0;
        end if;
    end loop;
    return 1;
end;

SELECT prim(21) from dual;

set serveroutput on;
CREATE OR REPLACE PROCEDURE fib(n integer) IS
    t NUMBER;
    a NUMBER := 0;
    b NUMBER := 1;
BEGIN
    IF n < 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Incorrect number');
    ELSIF n = 1 THEN
        DBMS_OUTPUT.PUT_LINE(a);
    ELSE
        FOR i IN 2..n LOOP
            t := a + b;
            a := b;
            b := t;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(b);
    END IF;
END;
execute fib(12);



CREATE OR REPLACE FUNCTION factor(n integer) RETURN integer IS
    r number :=1;
begin
    For i in 2..n loop
       r := r*i;
    end loop;
    return r;
end ;
select factor(10) from dual;

CREATE OR REPLACE FUNCTION gcd(p1 integer, p2 integer) RETURN number IS
    a number;
    b number;

begin
    a := p1;
    b := p2;
    while a<> b loop
    
        if a > b then
            a := a-b;
        else 
            b := b -a;
        end if;
    end loop;
    return a;       
end;
SELECT gcd(3570,7293) FROM dual;

CREATE OR REPLACE FUNCTION lcm(p1 integer, p2 integer) RETURN number IS
    a number;
    b number;
    r number;
begin
    a := p1;
    b := p2;
    r := (a * b)/gcd(a,b);
    return r;
end;
select lcm(2,23) from dual;

CREATE OR REPLACE FUNCTION lcm(p1 integer, p2 integer) RETURN number IS
    a number;
    b number;
    r number;
begin
    a := p1;
    b := p2;
    if a > b then
    r := a;
    else
    r := b;
    end if;
    while true loop
        if mod(r,a) =0 and mod(r,b)=0 then
        return r;
        end if;
        r := r + r;
    end loop;
    return r;
end;
select lcm(2,23) from dual;
CREATE OR REPLACE FUNCTION num_times(p1 VARCHAR2, p2 VARCHAR2) RETURN integer IS
    cnt number :=1;
begin
    while instr(p1,p2,1,cnt) > 0 loop
        cnt := cnt + 1;
    end loop;
    return cnt-1;
end;
SELECT num_times ('ab c ab ab de ab fg', 'ab') FROM dual;
SELECT num_times ('ab c ab ab ab de ab fg', 'ab') FROM dual;


