select * from likes; 

--1
select fruits from likes where name = 'Winnie';

--2
select fruits from likes
MINUS
select fruits from likes where name = 'Winnie';

--3
select name from likes where fruits = 'apple';

--4
select name from likes
MINUS
select name from likes where fruits = 'pear';

--5
select name from likes where fruits = 'raspberry'
UNION
select name from likes where fruits = 'pear';

--6
select name from likes where fruits = 'apple'
INTERSECT
select name from likes where fruits = 'pear';

--7
select name from likes where fruits = 'apple'
MINUS
select name from likes where fruits = 'pear';

------------------------

--8
select distinct l1.name from likes l1 join likes l2 on l1.name=l2.name and l1.fruits<>l2.fruits; --variant 1
select distinct l1.name from likes l1 CROSS JOIN likes l2 where l1.name=l2.name and l1.fruits<>l2.fruits; --variant 2

--9
select distinct l1.name from likes l1 cross join likes l2 cross join likes l3 
where l1.name=l2.name and l2.name=l3.name and l1.fruits<>l2.fruits and l2.fruits<>l3.fruits and l1.fruits<>l3.fruits;

--10
select name from likes
MINUS
(select distinct l1.name from likes l1 cross join likes l2 cross join likes l3 
where l1.name=l2.name and l2.name=l3.name and l1.fruits<>l2.fruits and l2.fruits<>l3.fruits and l1.fruits<>l3.fruits);

--11
select distinct l1.name from likes l1 join likes l2 on l1.name=l2.name and l1.fruits<>l2.fruits
INTERSECT 
    select name from likes
    MINUS
    (select distinct l1.name from likes l1 cross join likes l2 cross join likes l3 
    where l1.name=l2.name and l2.name=l3.name and l1.fruits<>l2.fruits and l2.fruits<>l3.fruits and l1.fruits<>l3.fruits);

---------------------------------------

select * from paltamas.emp;
select * from paltamas.dept;

--16
select e1.ename from emp e1 join emp e2 on e1.mgr = e2.empno and e2.ename='KING';

--17
select distinct e2.ename from emp e1 join emp e2 on e1.mgr = e2.empno and e2.job<>'MANAGER';

--18
--HW
--19
select distinct e1.ename from emp e1 CROSS JOIN emp e2 CROSS JOIN emp e3 
where e1.mgr=e2.empno and e2.mgr=e3.empno and e3.ename='KING'; 

--20
--select * from emp natural join dept;
select ename from emp natural join dept where loc='DALLAS' or loc='CHICAGO';
--21
--HW
--22
select ename from emp natural join dept where sal>2000 or loc='CHICAGO';
--23
select deptno from dept
MINUS
select deptno from emp;
--24
select distinct e2.ename from emp e1 join emp e2 on e1.mgr=e2.empno and e1.sal>2000;
--25
select ename from emp
MINUS
select e2.ename from emp e1 join emp e2 on e1.mgr=e2.empno and e1.sal>2000;
--26
select dname, loc from emp natural join dept where job='ANALYST';
--27
select dname, loc from emp natural join dept
MINUS
select dname, loc from emp natural join dept where job='ANALYST';
--28
select ename from emp 
MINUS   
    (select e1.ename from emp e1 join emp e2 on e1.sal<e2.sal);