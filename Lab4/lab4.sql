use Company_SD

--answer q1 'a'

select Dependent.Dependent_name,Dependent.Sex
from Dependent
inner join Employee on Employee.SSN=Dependent.ESSN
where Employee.Sex = 'F' and Dependent.Sex='F'

UNION
--answer q1 'b'

select Dependent.Dependent_name,Dependent.Sex
from Dependent
inner join Employee on Employee.SSN=Dependent.ESSN
where Employee.Sex = 'M' and Dependent.Sex='M';

--answer q2

select  Project.Pname, sum(Works_for.Hours) as  Total_Hours
from Project 
inner join Works_for on Project.Pnumber=Works_for.Pno
group by Project.Pname

--answer q3

select Departments.*
from Departments 
inner join Employee on Departments.Dnum=Employee.Dno
where Employee.SSN in 
(select min(Employee.SSN)
   from Employee
   
);

--answer q4

select Departments.Dname,min(Employee.Salary) as Min_Salary,max(Employee.Salary) as Max_Salary ,AVG(isnull(Employee.Salary,0)) as Avg_Salary
from Departments
inner join Employee on Departments.Dnum=Employee.Dno
group by Departments.Dname

--answer q5
--xxxxxxxxxxxxxxx
select Employee.Lname
from Employee
inner join Departments on Employee.SSN=Departments.MGRSSN
left outer join Dependent on Employee.SSN=Dependent.ESSN
where Dependent.ESSN is null;

--answer q6

select Departments.Dnum, Departments.Dname,count(isnull(Employee.SSN,0)) as number_of_Employee
from Departments
inner join Employee on Departments.Dnum=Employee.Dno
group by Departments.Dnum,Departments.Dname
           --as paernt
----------Don't understand
having avg(Employee.salary)<(select avg(e.salary) from Employee e)


--answer q7
----x
select Employee.*,Project.Pname
from Employee 
inner join Works_for on Employee.SSN=Works_for.ESSn
inner join Project on Project.Pnumber=Works_for.Pno
order by Employee.Dno,Employee.Lname,Employee.Fname




--answer q8

select
  (SELECT MAX(Salary) FROM Employee) maxsalary1,
  (SELECT MAX(Salary) FROM Employee
  WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee )) as maxsalary2

--answer q9
--xxxxx
select Employee.Fname+' '+Employee.Lname as fullName
from Employee
inner join Dependent on Employee.SSN=Dependent.ESSN 
where Employee.Fname+' '+Employee.Lname = Dependent.Dependent_name


--answer q10

update Employee
set Salary = Salary*1.3
where Employee.SSN in (
select Employee.SSN
from Employee
inner join Works_for on Employee.SSN=Works_for.ESSn
inner join Project on Works_for.Pno=Project.Pnumber
where Project.Pname='Al Rabwah')

--answer q11

select Employee.SSN,Employee.Fname
from Employee
where exists (
select *
from Employee
inner join Dependent on Employee.SSN=Dependent.ESSN
)

----------------------DML--------------------------
--answer 1

insert into Departments (Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPTIT',100,112233,'1-11-2006');

--answer 2
--a
update Departments
set MGRSSN=968574
where Departments.Dnum=100

--b

update Departments
set MGRSSN=102672
where Departments.Dnum=20

--c
update Employee
set Superssn=102672
where SSN=102660

--answer 3

update Departments 
set MGRSSN =  102672
where mgrssn = 223344

delete from Dependent 
where ESSN = 223344

update Employee 
set Superssn = 102672
where Superssn = 223344

update Works_for 
set ESSn = 102672
where ESSn = 223344

delete from Employee 
where ssn = 223344
