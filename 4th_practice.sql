--last HW 
--18
select e1.ename from paltamas.emp e1 join paltamas.emp e2 on e1.mgr=e2.empno and e1.sal>e2.sal;

--21
select ename from emp 
MINUS
select ename from emp natural join dept where loc='CHICAGO' or loc='DALLAS';

select ename from emp natural join dept where loc<>'CHICAGO' and loc<>'DALLAS'; 


---------------------------

--1
select ename from emp where mod(sal, 15)=0;
-- ? ename ( ? sal % 15 = 0 (Emp) )
--2
select ename from emp where hiredate > '82.JAN.01';
--3
select ename from Emp where ename like '_A%';
select ename from Emp where SUBSTR(ename, 2, 1)='A';
--4
select ename from Emp where ename like '%L%L%';
select ename from Emp where LENGTH(ename) - LENGTH(REPLACE(ename, 'L', ''))=2;
--5
select SUBSTR(ename, LENGTH(ename)-2, 3) as lastchars from Emp;
--6
--HW
--7
select ROUND(SQRT(sal), 2) as rounded_sqrt, TRUNC(SQRT(sal)) int_sqrt from Emp;
--8
select to_char(hiredate, 'Month') from Emp where ename='ADAMS';
--9
select Trunc(SYSDATE - hiredate, 0) from Emp where ename='ADAMS';
--10
select ename from emp where trim(' ' from to_char(hiredate, 'Day'))='Tuesday';
--11
select e1.ename, e2.ename from paltamas.emp e1 join paltamas.emp e2 on e1.mgr=e2.empno 
where length(e1.ename)=length(e2.ename);
--12
select * from paltamas.sal_cat;
select e.ename from emp e join sal_cat sc on e.sal >= sc.lowest_sal and e.sal<=highest_sal where sc.category=1;
--13
--HW
--14
select e1.hiredate - e2.hiredate from emp e1 join emp e2 on e1.ename='KING' and e2.ename='JONES';
--15
select to_char(LAST_DAY(hiredate),'Day') from Emp where ename='KING';
--16
select to_char(Trunc(hiredate, 'Month'),'Day') from Emp where ename='KING';

--17 -- cross join solution
select ename from emp, dept, sal_cat 
where emp.deptno=dept.deptno and emp.sal >= sal_cat.lowest_sal and emp.sal<=sal_cat.highest_sal
and sal_cat.category>=4 and dept.dname like '%C%';
--17 -- natural join, theta join
select ename from emp natural join dept join sal_cat on sal >= lowest_sal and sal<=highest_sal
where sal_cat.category>=4 and dept.dname like '%C%';
--18
select ename, sal, rpad('#', round(sal/1000), '#') from emp;