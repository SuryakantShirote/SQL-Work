
 create database assignment
 use assignment

 create table Employee (
 Employee_id int not null,
 First_name varchar (20) not null,
 Last_name varchar (20) not null,
 salary int ,
 Joining_date date,
 Department varchar (20)
 primary key (Employee_id)
 )


   insert into Employee values 
   (1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
   (2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
   (3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
   (4,'Sushant','Singh',500000,'2020-02-17 9:00:00','Admin')
   (5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
   (6,'Dhiraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
   (7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
   (8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')


   create table EmployeeBonus(
   Employee_ref_id int not null,
   Bonus_Amount int not null,
   Bonus_Date datetime not null,
   foreign key (Employee_ref_id) references Employee(Employee_id)
   )

   insert into  EmployeeBonus values 
   (1,5000,'2020-02-16 0:00:00'),
   (2,3000,'2011-06-16 0:00:00'),
   (3,4000,'2020-02-16 0:00:00'),
   (1,4500,'2020-02-16 0:00:00'),
   (2,3500,'2011-06-16 0:00:00')

   create table EmployeeTitle(
   Employee_ref_id int not null,
   Employee_title varchar (20) not null,
   Affective_date datetime not null
   )

   insert into EmployeeTitle values
   (1,'Manager','2016-02-20 0:00:00'),
   (2,'Executive','2016-06-11 0:00:00'),
   (8,'Executive','2016-06-11 0:00:00'),
   (5,'Manager','2016-06-11 0:00:00'),
   (4,'Asst.Manager','2016-06-11 0:00:00') ,
   (7,'Executive','2016-06-11 0:00:00'),
   (6,'Lead','2016-06-11 0:00:00'),
   (3,'Lead','2016-06-11 0:00:00')

   select * from employee
   select * from employeeBonus
   select * from employeeTitle


 -- 1) Display the 'FIRST_NAME' from Employee table using the alis name as Emplyee_name 
   
       Select first_name as Employee_name from Employee;

 --	2) Display 'Last_Name' from employee table in upper case
       
	   Select upper (Last_name) AS LAST_NAME from Employee;
	   
 -- 3) Display unique values of DEPARTMENT from employee table 

       Select distinct (Department)  from employee; 

 -- 4) Display  the first three characters of LAST_NAME from employee table 

       Select substring(Last_name, 1,3) AS LAST_NAME from employee ;

 -- 5) Display unique values of DEPARTMENT from employee table and print its length

       Select distinct (Department),len(Department) as length from Employee
	   group by Department;

 -- 6) Display the 'FIRST_NAME' and 'Last_Name' from employee table into a single column 
 --    as FULL_NAME a space char should separate them

	   Select  concat (first_name, '     ' , Last_name)  as full_name from Employee;
	   
 -- 7) Display all employee details from the employee table order by First_name ascending
       
	   Select * from employee 
	   order by First_name asc ;

 -- 8) Display all employee details from the employee table order by First_name ascending 
 --    and Department descending
       
	   Select * from Employee 
	   order by first_name asc, department desc;

 -- 9) Display details for employee with first name as 'veena' and 'karan' from employee table 

       Select * from Employee
	   where First_name='veena' or  First_name='karan';

 -- 10) Display details of employee with DEPARTMENT name as 'Admin'

        Select * from Employee
		where department= 'Admin';

 -- 11) Display details of employee whose first name contains 'v'
       
	    Select * from Employee
		where  First_name like '%v%';

 -- 12) Display details of employees whose salary lies between 100000 and 500000

        Select * from Employee
		where  salary between 100000 and 500000;

 -- 13) Display details of the employees who have joined in feb-2020

        Select * from Employee
		where year(joining_date)=2020
		and month(joining_date)=2;

 -- 14) Display employee names with salaries >= 50000 and <=100000

        Select concat(first_name,'    ',last_name)as Employee_name ,Salary from Employee
	    where Employee_id in (Select Employee_id from Employee 
		where Salary >= 50000 and Salary <= 100000);


 -- 15)  Display details of the employees who are also managers

         Select  *  from employee inner join 
		 Employeetitle on employee_id = Employee_ref_id
		 where Employee_title = 'Manager';

 -- 16)  Display duplicate records having matching data in some fields of a table

         Select  Salary, Department ,count(*) as Duplicate_Records from Employee
		 group by  Salary, Department
		 having count(*) > 1;
		 
	
 -- 17) Display only odd rows from tables
        Select * from ( Select * , row_number() over (order by employee_id) as R
	    from Employee) as RT where R=1 OR R=3 OR R=5 OR R=7
--OR	   
	    SELECT * FROM EMPLOYEE WHERE (Employee_id%2)<>0
	   
 -- 18) Clone a new table from employee table

        Select * into CLONE    --DROP TABLE EmployeeClone
		from Employee;
		
 -- 19) Display the top 2 highest salary from employee 

        Select top 2 max(salary) as HIGHEST_SALARY from employee 
		group by salary order by salary desc;
	
	   
 -- 20) Display the list of employees  with same salary
       Select * From Employee Where Salary IN (Select Salary From Employee group by Salary
       having count(*)>1 );

-- 21) Display the second highest salary from a table 
       
        Select max(salary) from Employee where Salary < (Select max(Salary) from Employee);
		 

 -- 22) Display the first 50% records from table 

        Select top 50 percent * from Employee;
		
 -- 23) Display the departments that have less than 4 people in it 

        Select First_name , Department from Employee 
		where Department in (Select Department from Employee group by Department 
		having count(*)< 4 );
	
 -- 25) Display all departments along with number of people in there

        Select Department ,count (*) as NUMBER_OF_PEOPLE
		from Employee 
		group by Department;

 -- 26) Display the name of employees having the highest salary in each department

        Select First_name , Department,Salary from Employee 
		where Salary in (Select max(Salary) from Employee
		group by Department );
		
 -- 27) Display the name of employees who earn the highest salary
        
		Select first_name , Last_name, Salary  from employee 
		where Salary in ( Select max(Salary) from Employee);
	
		
 -- 28) Display the average salaries for each department

        Select Department , avg(Salary) as Average_Salary from Employee
		group by Department;


 -- 29) Display the name of employee who has got maximum bonus 

        Select First_name , Last_name , Bonus_Amount from Employee inner join EmployeeBonus
		on Employee.Employee_id =  EmployeeBonus.Employee_ref_id where Bonus_Amount  in 
		(Select max(Bonus_Amount) from EmployeeBonus );

 -- 30) Display the first name and title of all the employees

        Select First_name , Employee_title from Employee INNER JOIN EmployeeTitle
		ON Employee. Employee_id = EmployeeTitle.Employee_ref_id;

--19) Display the top 2 highest salary from employee 

      Select top 2 max(Salary) as HIGHEST_SALARY  from Employee
	  group by Salary order by Salary desc;
   


	
