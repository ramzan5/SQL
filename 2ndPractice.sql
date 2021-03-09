--select * from emp;
--GRANT SELECT ON emp TO public;
select * from paltamas.emp;

--1
Select * from emp where sal > 2800;
--2
select * from emp where deptno=10 or deptno=20;
select * from emp where deptno in (10, 20);
--3
select * from emp where comm > 600;
--4
--5
select * from emp where comm is null;
--6
select job from emp;
select distinct job from emp;
--7
--8
select * from emp where hiredate > '82-JAN-01';
--9
select * from emp where mgr is null;
--10
select * from emp where ename like '%A%';
--11
--12
select * from emp where sal BETWEEN 2000 AND 3000;
--13
select ename, sal from emp order by sal ;
--14
select ename, sal from emp order by sal desc, ename asc;
--15
select * from emp where mgr = '&ename';

-------------------------------------

--select * from likes;
--GRANT SELECT ON likes TO public;
select * from paltamas.likes;

--1
select distinct fruits from likes where name='Winnie';
--2
select distinct fruits from likes
MINUS
select distinct fruits from likes where name='Winnie';
