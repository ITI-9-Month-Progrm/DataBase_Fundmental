use Company_SD
/*answer 1*/
SELECT * from Employee

/*answer 2*/
SELECT Fname,Lname,Salary,Dno
from Employee

/*answer 3*/
select Pname,Plocation,Dnum 
from Project


/*answer 4*/
select Fname +' '+ Lname as FullName , Salary*12*0.1 as ANNUAL_COMM 
from Employee ;

/*answer 5*/
select SSN, Fname +' '+ Lname as FullName 
from Employee
where Salary >1000;

/*answer 6*/

select SSN, Fname +' '+ Lname as FullName 
from Employee
where Salary*12 >1000;

/*answer 7*/
select Fname +' '+ Lname as FullName ,Salary 
from  Employee 
where Sex ='F';

/*answer 8*/

select Dnum,Dname
from Departments
where MGRSSN=968574;

/*answer 9*/
select Pnumber,Pname,Plocation
from Project
where Dnum=10;
 