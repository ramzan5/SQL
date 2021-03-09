--HW last time
--6
select ename from paltamas.emp where substr(ename, length(ename)-1, 1)='T';
select ename from paltamas.emp where substr(ename, -2, 1)='T';
--13
select * from paltamas.emp e join paltamas.sal_cat sc on e.sal>=sc.lowest_sal and e.sal<=sc.highest_sal
where mod(sc.category, 2)=0;

----------------
--1
select max(sal) as max_sal from paltamas.emp;
--2
select sum(sal) as sum_sal from paltamas.emp;
--3
select sum(sal) as sum_sal , avg(sal) as avg_sal from paltamas.emp where deptno=20;
--4
--select * from emp;
select count(distinct job) as num_jobs from paltamas.emp;
--5
--HW
--6
select deptno, round(avg(sal),2) as avg_sal from paltamas.emp group by deptno;
--7
select deptno, loc, round(avg(sal),2) as avg_Sal 
from paltamas.emp natural join paltamas.dept group by deptno, loc;
--8
select deptno, count(empno) as num_emps  from paltamas.emp group by deptno;
--9
select deptno, avg(sal) as avg_sal from paltamas.emp group by deptno having avg(sal)>2000;
--10
select deptno, avg(sal) as avg_sal from paltamas.emp group by deptno having count(empno)>=4;
--11
select deptno, loc, avg(sal) as avg_sal from paltamas.emp natural join paltamas.dept
    group by deptno, loc having count(empno)>=4;
--12    
--HW
--13
select category from paltamas.emp join paltamas.sal_cat on sal>=lowest_sal and sal<=highest_sal 
group by category having count(empno)=3;
--14
select category from paltamas.emp join paltamas.sal_cat on sal>=lowest_sal and sal<=highest_sal 
group by category having count(distinct deptno)=1;
--15
select mod(empno, 2) as parity, count(empno) as num_of_emps from paltamas.emp group by mod(empno, 2);
--16
select job, count(empno) as num_emps, avg(sal) as avg_sal, rpad('#', trunc(avg(sal)/200), '#') 
from paltamas.emp group by job;

-----
SELECT count(comm), count(*), count(sal), count(distinct sal), 
       sum(sal), sum(distinct sal), trunc(avg(sal)), avg(distinct sal)
FROM nikovits.emp WHERE ename like '%O%';
