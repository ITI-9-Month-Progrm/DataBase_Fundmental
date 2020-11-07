use ITI

--part 1

--q1

select COUNT(Student.St_Age) as age
from Student;

--q2
select Ins_Name
from(
select * ,ROW_NUMBER()over (order by Ins_Name desc) as rn from Instructor) as x
order by Ins_Name asc

--select distinct Instructor.Ins_Name from Instructor

--q3

select  Student.St_Id as studentID,ISNULL(Student.St_Fname,' ')+' '+ISNULL(Student.St_Lname,' ') as fullName ,ISNULL(Department.Dept_Name,' ') as DepartmentName
from Student
inner join Department on Department.Dept_Id=Student.Dept_Id

--q4
 select Ins_Name , Department.Dept_Name
 from Instructor
 left outer join Department on Department.Dept_Id=Ins_Id
 
 --q5
 select Student.St_Fname+' '+Student.St_Lname as fullName ,Course.Crs_Name                 
 from Student
 inner join  Stud_Course on Student.St_Id=Stud_Course.St_Id
 inner join Course on Course.Crs_Id=Stud_Course.Crs_Id
 where Stud_Course.Grade!=0

 --q6
  SELECT MAX(Topic.Top_Name) AS Topic_name, COUNT(Course.Crs_Name) AS Count_Course
    FROM Topic
    LEFT JOIN Course ON Topic.Top_Id = Course.Top_Id
    GROUP BY Top_Name


--q7

select isnull(MAX(Instructor.Salary) ,0)as maxSalary ,isnull(min(Instructor.Salary),0) as minSalary
from Instructor

--q8
--xx
select ISNULL(Instructor.Salary,0) as result
from Instructor
where Instructor.Salary < (select avg(isnull(Instructor.Salary,0)) from Instructor )

--q9
select Department.Dept_Name as DeptName
from Department
inner join Instructor on Department.Dept_Id=Instructor.Dept_Id
where Instructor.Salary=(select min(isnull(Instructor.Salary,0)) from Instructor )

--q10

select Top(2) Instructor.Salary 
from Instructor
order by Instructor.Salary desc

--q11

select  coalesce(str(Instructor.Salary) ,'bouns')  as salary
from Instructor

--q12

select avg(isnull(Instructor.Salary,0)) as instructorSalary
from Instructor
--group by Instructor.Salary 

--q13

select Ch.St_Fname as StudentName , super.*  
from Student super
inner join Student Ch on super.St_Id=ch.St_super


--q14
select Salary
from (
select * ,DENSE_RANK()over ( order by Instructor.Salary desc) as DR from Instructor) as newTable
where DR<=2

--q15

SELECT TOP (1) Student.St_Fname+' '+Student.St_Lname as fullName 
FROM Student
inner join Department on Department.Dept_Id=Student.Dept_Id
ORDER BY NEWID() 
