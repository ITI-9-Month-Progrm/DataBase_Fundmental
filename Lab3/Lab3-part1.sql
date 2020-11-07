use Company_SD

--Q1
--answer 1

select  Departments.Dnum,Departments.Dname,Departments.MGRSSN,Employee.Fname
from Departments 
inner join Employee ON Departments.MGRSSN=Employee.SSN;

--answer 2

select Departments.Dname,Project.Pname
from Departments
inner join Project on Departments.Dnum=Project.Dnum;

--answer 3

select Dependent.*
from Dependent
left join Employee on Dependent.ESSN=Employee.SSN;

--answer 4

select Project.Pnumber,Project.Pname,Project.Plocation
from Project
where City = 'Cairo' or City='Alex';

--answer 5

select * from Project where Pname like 'a%';

--answer 6

select Employee.Fname+' '+Employee.Lname as FullName 
from Departments
right join Employee on Departments.Dnum=Employee.Dno 
where Departments.Dnum=30 and  Employee.Salary between 1000 and 2000;

--answer 7

--some thing error 

select Employee.Fname+' '+Employee.Lname as FullName 
from Employee
inner join Works_for on Employee.SSN=Works_for.ESSn
inner join Project on Works_for.Pno=Project.Pnumber
where Employee.Dno=10 and Works_for.Hours>=10  and Project.Pname='AL Rabwah';

--answer 8
--xxxxxxxxxxxxxxxx
select temp1.Fname+' '+temp1.Lname as FullName 
from Employee temp1
inner join Employee  temp2 on temp1.SSN=temp2.Superssn
where temp1.Fname ='Kamel' and temp1.Lname='Mohamed';

--answer 9

select Employee.Fname+' '+Employee.Lname as FullName ,Project.Pname
from Employee
inner join Works_for on Employee.SSN=Works_for.ESSn
inner join Project on Works_for.Pno=Project.Pnumber
order by Project.Pname desc; 

--answer 10
--xxxxxxxxxxx
select Project.Pnumber,Departments.Dname,Employee.Lname,Employee.Address,Employee.Bdate
from Departments 
inner join Employee on Employee.SSN=Departments.MGRSSN
inner join Project on Departments.Dnum=Project.Dnum
where Project.City='Cairo';

--answer 11
--xxxxxxxxxxxxxxxxx

select Departments.*
from Employee 
inner join Departments   on Employee.SSN=Departments.MGRSSN;

--answer 12xxxxxxxxxxxxxxxxxx
select Employee.*
from Employee
left join Dependent on  Employee.SSN=Dependent.ESSN;



-------------------

insert into Employee (Dno,SSN,Superssn,Salary)
values(30,102672,112233,3000);


------------------------------------


insert into Employee (Dno,SSN)
values(30,102660);

---------------------

update Employee 
set Salary=Salary*1.2
where SSN=102672;


