
CREATE TABLE emp2 AS SELECT * FROM nikovits.emp;--this commond create the copy of the table
CREATE TABLE dept2 AS SELECT * FROM nikovits.dept;--this commond create the copy of the table
Create table catg as select * from NIKOVITS.sal_cat;
select * from emp2;
select * from dept2;
select * from catg;
--1
delete from emp2 where comm is null;
--2
delete from emp2 where hiredate < '01-Jan-1982';
--3
DELETE from emp2 where empno in
(select empno from emp2 natural join dept2 where loc = 'DALLAS');
--4
Delete from emp2 where sal < 
(select avg(sal)  from emp2);
--5
Delete from emp2 e where sal < 
(select avg(sal)  from emp2 where deptno = e.deptno);
--6

Delete from emp2 where  sal =
(select max(sal)  from emp2);
--7
Delete from dept2 where deptno in 
(select deptno from emp2 join catg on sal between lowest_sal and highest_sal where category =2);
--8
Delete from dept2 where deptno in 
(select deptno from emp2 join catg on sal between lowest_sal and highest_sal where category =2 group by deptno having count(*)<2);

ROLLBACK;--return the table into orignal form

--Insert Function
insert into emp2 (empno,ename,deptno,hiredate,sal)
values (1,'Smith',10,sysdate,(select avg(sal) from emp2 where deptno=10));

insert into emp2 (empno,ename,deptno,hiredate,sal)
select 1,'Smith',10,sysdate,(select avg(sal) from emp2 where deptno=10) from dual;
--1
update emp2 set sal = sal *.20 + sal where deptno =20;
--2
update emp2 set sal = 500 + sal where comm is Null or sal < (select avg(sal)from emp2);
--3
UPDATE emp2 set comm = COALESCE(comm, 0) + (select max(comm) from emp2);
--4
UPDATE emp2 set ename = 'poor' where sal in (select min(sal) from emp2);
--5

UPDATE emp2 set comm = COALESCE(comm, 0)  + 3000 where empno in 
(select e1.empno from emp2 e1 join emp2 e2 on e1.empno = e2.mgr GROUP by e1.empno having count(*)>=2);

--6
Update emp2 set sal = sal + (select min(sal) from emp2) where empno in 

(select e1.empno from emp2 e1 join emp2 e2 on e1.empno = e2.mgr);

update emp2  e set sal =  sal + (select avg(sal) from emp2 where deptno = e.deptno) where
empno not in (select e1.empno from emp2 e1 join emp2 e2 on e1.empno = e2.mgr);

ROLLBACK;
