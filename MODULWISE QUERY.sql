     create database mudulwise
     use mudulwise
 /*  Problem Statement: Consider yourself to be Sam and you have been given the below tasks to
     complete using the Table – STUDIES, SOFTWARE & PROGRAMMER */
-- Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), 
SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

-- View
 select * from Software

 -- Programmer Table
CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), 
PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500

-- View
select * from Programmer
 
--MODULE 1 BASICS 

--1.Find out the selling cost AVG for packages developed in Pascal.
    Select AVG(SCOST) as Average_SCOST from Software where DEVELOPIN='PASCAL';

--2. Display Names, Ages of all Programmers.
     Select PNAME as Names, YEAR (GETDATE()) - YEAR(DOB) as Ages from Programmer;
--Or

     Select PNAME as Names, DATEDIFF(YYYY,DOB,GETDATE()) as Ages from Programmer;
--Or
     Select PNAME as Names, DATEDIFF(YY, DOB, '18-Dec-2022') as Ages from Programmer;

--3. Display the Names of those who have done the DAP Course.
     Select PNAME as Names from Studies Where COURSE ='DAP';

--4. Display the Names and Date of Births of all Programmers Born in January.
     Select PNAME as Names, DOB, MONTH(DOB) as January from Programmer where MONTH(DOB)=01;

--5. Display the Details of the Software Developed by Ramesh.
     Select * from Software where PNAME ='RAMESH';

--6. Display the Details of Packages for which Development Cost have been recovered.
     Select *, SOLD*SCOST as SALES from Software where SOLD*SCOST > DCOST;

--7. Display the details of the Programmers Knowing C
     Select * from Programmer where PROF1='C' OR PROF2='C';

--8. What are the Languages studied by Male Programmers.
     Select PNAME,PROF1,PROF2 FROM programmer Where GENDER='M';

--9. Display the details of the Programmers who joined before 1990. 
     Select * from Programmer where YEAR(DOJ) < 1990;
	 
/*10. Who are the authors of the Packages, which have recovered more than double the 
      Development cost? */
	  Select PNAME,TITLE from Software where SOLD*SCOST > 2*DCOST;
	  





--MODULE 2 OPERATORS AND CLAUSES ASSIGNMENT 

--1. What is the cost of the costliest software development in Basic?
     Select  TITLE,MAX(SCOST) as Costilest_Software from Software
	 where DEVELOPIN='BASIC' GROUP BY TITLE ;
	
--2. Display details of Packages whose sales crossed the 2000 Mark.
     Select *, SOLD*SCOST as Sales from Software where SOLD*SCOST >2000 Order by Sales; 
--OR
	 SELECT TITLE, SUM(SCOST*SOLD) AS TOTAL_REVENUE FROM software 
     GROUP BY TITLE HAVING SUM(SCOST*SOLD)>2000;

--3. Who are the Programmers who celebrate their Birthdays during the Current Month?
     Select PNAME , MONTH(DOB) AS BIRTHDAY_MONTH , MONTH(GETDATE()) AS CURRENT_MONTH From Programmer
	 Where MONTH(DOB)=MONTH(GETDATE()) ;
	 
--OR
     SELECT PNAME FROM programmer WHERE MONTH(DOB)=MONTH(GETDATE());



--4. Display the Cost of Package Developed By each Programmer. 
     Select PNAME , SUM(SCOST) as TOTAL_COST from Software 
	 GROUP BY PNAME ;
	
--5. Display the sales values of the Packages Developed by the each Programmer. 
     Select PNAME , SUM(SCOST*SOLD) As SALES_VALUES from Software 
	 GROUP BY PNAME ;
	
	

--6. Display the Number of Packages sold by Each Programmer. 
     Select PNAME , SUM(SOLD) as NO_OF_SOLD_PACKEGES  From Software GROUP BY PNAME ;;
	
--7. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
     Select PNAME as PROGRAMMER_NAME , MAX(DCOST) as COSTLIEST_PACKAGE ,
	 MIN(DCOST) as CHEAPEST_PACKAGE 
	 from Software GROUP BY PNAME ;


	
 
--8. Display each institute name with number of Courses, Average Cost per Course.
     Select INSTITUTE as  INSTITUTE_NAME , COUNT(COURSE) as NO_OF_COURSES ,
	 AVG(COURSE_FEE) as AVG_COST_PERCOURSE
	 From Studies GROUP BY INSTITUTE;
	   
--9. Display each institute Name with Number of Students. 
     Select INSTITUTE as  INSTITUTE_NAME , COUNT(PNAME) as NO_OF_STUDENTS  from Studies 
	 GROUP BY  INSTITUTE;
	
--10.List the programmers (form the software table) and the institutes they studied
     Select SOFTWARE.PNAME , INSTITUTE From STUDIES INNER JOIN SOFTWARE ON
	 SOFTWARE.PNAME = STUDIES.PNAME;
--OR
     SELECT PNAME,INSTITUTE from studies WHERE PNAME IN (SELECT PNAME from software);






	 
/*11.How many packages were developed by students, who studied in institute that charge the
     lowest course fee?*/	     SELECT PNAME, COUNT(TITLE) FROM software WHERE PNAME IN
    (
    SELECT PNAME FROM studies WHERE INSTITUTE =
   (SELECT DISTINCT INSTITUTE FROM studies WHERE COURSE_FEE = 
   (SELECT MIN(COURSE_FEE) FROM Studies))
   )
    GROUP BY PNAME;--12.What is the AVG salary for those whose software sales is more than 50,000/-.
    Select AVG(SALARY) AS AVG_SALARY  From PROGRAMMER AS P
	INNER JOIN SOFTWARE AS S ON P.PNAME = S.PNAME 
	WHERE(SCOST*SOLD) > 50000;




--13.Which language listed in prof1, prof2 has not been used to develop any package	
	 Select  DISTINCT PROF1 From PROGRAMMER Where 
	 PROF1 NOT IN (Select DEVELOPIN From SOFTWARE ) 
	 UNION 
	 Select DISTINCT PROF2 From PROGRAMMER Where
	 PROF2 NOT IN (Select DEVELOPIN From SOFTWARE ) ;
	 


--14. Display the total sales value of the software, institute wise.
      SELECT SUM(SCOST*SOLD) AS SALES , INSTITUTE FROM SOFTWARE INNER JOIN STUDIES 
	  ON SOFTWARE.PNAME = STUDIES.PNAME GROUP BY INSTITUTE;

/*15. Display the details of the Software Developed in C By female programmers of
      Pragathi.*/
	  Select S.*, P.GENDER , ST.INSTITUTE from Software AS S INNER JOIN Programmer AS P
	  on S.PNAME =  P.PNAME INNER JOIN Studies AS ST ON 
	  S.PNAME = ST.PNAME 
	  Where DEVELOPIN = 'C' and GENDER = 'F' and INSTITUTE = 'Pragathi';
	 

--16. Display the details of the packages developed in Pascal by the Female Programmers.
      Select * FROM Programmer P, Software S 
      where P.PNAME=S.PNAME AND GENDER='F' AND DEVELOPIN='PASCAL';

--17. Which language has been stated as the proficiency by most of the Programmers?
      CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
      CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

      INSERT INTO #PCNT
      SELECT PROF1, COUNT(pname) FROM programmer GROUP BY PROF1 UNION ALL
      SELECT PROF2, COUNT(pname) FROM programmer GROUP BY PROF2

      select * from #PCNT

      INSERT INTO #PsCNT
      SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

      select * from #PsCNT

      SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
      (SELECT MAX(sCNT) FROM #PsCNT)


	 
--18. Who is the Author of the Costliest Package?
      Select PNAME , SCOST  from  Software where 
	  SCOST = (Select MAX(SCOST) from Software);
	  
--19. Which package has the Highest Development cost?
      Select TITLE , DCOST from Software where
	  DCOST = ( Select MAX(DCOST) from Software ); 
	  
--20. Who is the Highest Paid Female COBOL Programmer?
      Select * from Programmer
	  where SALARY = (Select MAX(SALARY) from Programmer 
	  where PROF1 = 'COBOL' OR PROF2 = 'COBOL')
	  AND GENDER = 'F';

--21. Display the Name of Programmers and Their Packages.
      Select PNAME as NAME_OF_PROGRAMMER , TITLE as PACKEGES from Software 
	  ORDER BY PNAME; 

--22. Display the Number of Packages in Each Language Except C and C++.
      Select DEVELOPIN, COUNT(TITLE) AS NO_OF_PKGS From software 
      Where DEVELOPIN NOT IN ('C','CPP') GROUP BY DEVELOPIN;





-- 23.Display AVG Difference between SCOST, DCOST for Each Package.
      Select TITLE , AVG(DCOST) AS AVGDCOST, AVG(SCOST) AS AVGSCOST,
	  AVG(DCOST-SCOST) AS AVG_DIFFERENCE  FROM Software 
	  GROUP BY TITLE;
	  

/*24. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for
      Those Whose Cost has not yet been Recovered.*/
	  Select PNAME ,SUM(SCOST*SOLD) AS TOTAL_SCOST , SUM(DCOST) AS TOTAL_DCOST ,
	  SUM((SOLD*SCOST)-DCOST) AS AMOUNT_TOBE_RECOVERED from software 
	  GROUP BY PNAME 
	  HAVING  SUM(DCOST) > SUM(SOLD*SCOST);


--25. Who is the Highest Paid C Programmers?
      Select * from Programmer
	  where SALARY = (Select MAX(SALARY) from Programmer 
	  where PROF1 = 'C' OR PROF2 = 'C');

--26. Who is the Highest Paid Female COBOL Programmer?
      Select * from Programmer
	  where SALARY = (Select MAX(SALARY) from Programmer 
	  where PROF1 = 'COBOL' OR PROF2 ='COBOL')
	  AND GENDER = 'F';
--OR

	  Select TOP 1 * From programmer Where 'COBOL' IN (PROF1,PROF2) AND GENDER='F'
      ORDER BY SALARY DESC;






--    TEMPORARY TEBLES_ASSIGNMENT

-- 1. Display the details of the software developed in DBASE by Male Programmers, who belong
--    to the institute in which most number of Programmer */
	  CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

      INSERT INTO #INST
      SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

      SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
      WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
      AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST)









--2. In which language are most of the programmer’s proficient?
     CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
     CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

     INSERT INTO #PCNT
     SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
     SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

     INSERT INTO #PsCNT
     SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

     SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
    (SELECT MAX(sCNT) FROM #PsCNT)
--3.In which month did the most number of programmers join?
    CREATE TABLE #MNTH (DOJ INT, CNT INT)  

    INSERT INTO #MNTH
    SELECT MONTH(DOJ), COUNT(PNAME) FROM Programmer GROUP BY MONTH(DOJ)   

    SELECT DOJ AS MONTH_OF_DOJ,CNT AS_THE_NO_OF_STD FROM #MNTH 
    WHERE CNT IN (SELECT MAX(CNT) FROM #MNTH)


--4.In which year was the most number of Programmers born.
    CREATE TABLE #YEAR (DOB INT, CNT INT)  

    INSERT INTO #YEAR
    SELECT YEAR(DOB), COUNT(PNAME) FROM Programmer GROUP BY YEAR(DOB)

    SELECT DOB AS YEAR_OF_DOB,CNT AS_THE_NO_OF_STD FROM #YEAR
    WHERE CNT IN (SELECT MAX(CNT) FROM #YEAR)

--5.Which programmer has developed the highest number of Packages?
    CREATE TABLE #PS (PSNAME VARCHAR(20) , CNT INT)  

    INSERT INTO  #PS 
    SELECT PNAME , COUNT(TITLE) FROM SOFTWARE GROUP BY PNAME

    SELECT PSNAME AS PROGRAMMER , CNT AS NO_OF_PKGS FROM #PS 
    WHERE CNT IN (SELECT MAX(CNT) FROM #PS)


--6. Which language was used to develop the most number of Packages.
     CREATE TABLE #DEVCNT (LANG VARCHAR(20), CNT INT)

     INSERT INTO #DEVCNT
     SELECT DEVELOPIN, COUNT(TITLE) FROM software GROUP BY DEVELOPIN

     SELECT LANG, CNT FROM #DEVCNT WHERE CNT=
     (SELECT MAX(CNT) FROM #DEVCNT)

--7.Which course has below average number of Students?
    CREATE TABLE #AVGCNT (CRS VARCHAR(20), CNT INT)

    INSERT INTO #AVGCNT
    SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE

    SELECT CRS,CNT FROM #AVGCNT WHERE CNT <=
    (SELECT AVG(CNT) FROM #AVGCNT)




--8.Which course has been done by the most of the Students?
    CREATE TABLE #ST (CRSE VARCHAR(20) , CNT INT)  

    INSERT INTO  #ST 
    SELECT COURSE ,COUNT(PNAME) FROM STUDIES GROUP BY COURSE

    SELECT CRSE AS COURSE , CNT AS NO_OF_STDS FROM #ST
    WHERE CNT IN (SELECT MAX(CNT) FROM #ST)


--9.Which Institute has the most number of Students?
    CREATE TABLE #INSTITUTE (INS VARCHAR(20), CNT INT)

    INSERT INTO #INSTITUTE
    SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

    SELECT INS AS INSTITUTE , CNT AS NO_OF_STDS FROM  #INSTITUTE
    WHERE CNT IN (SELECT MAX(CNT) FROM #INSTITUTE)



--10. Who is the Above Programmer Referred in 50?
      CREATE TABLE #PSLang(PROF VARCHAR(20))    

      INSERT INTO #PSLang 
      SELECT PROF1 FROM programmer 
      GROUP BY PROF1 HAVING
      PROF1 NOT IN (SELECT PROF2 FROM programmer) 
      AND COUNT(PROF1)=1
      UNION
      SELECT PROF2 FROM programmer 
      GROUP BY PROF2 HAVING
      PROF2 NOT IN (SELECT PROF1 FROM programmer) 
      AND COUNT(PROF2)=1

      SELECT PNAME, PROF FROM programmer INNER JOIN #PSLang ON
      PROF=PROF1 OR PROF=PROF2



--11. Display the names of the highest paid programmers for each Language
      CREATE TABLE #PLangSal(PROF VARCHAR(20), SAL INT)

      INSERT INTO #PLangSal 
      SELECT PROF1, MAX(SALARY) AS HighestPay FROM programmer
      GROUP BY PROF1

      INSERT INTO #PLangSal 
      SELECT PROF2, MAX(SALARY) AS HighestPay FROM programmer
      GROUP BY PROF2

      CREATE TABLE #PLangSalMax(PROF VARCHAR(20), SAL INT)

      INSERT INTO #PLangSalMax
      SELECT PROF, MAX(SAL) FROM #PLangSal GROUP BY PROF

      SELECT PNAME,PROF,SAL FROM programmer INNER JOIN #PLangSalMax
      ON PROF=PROF1 OR PROF=PROF2
      WHERE SAL=SALARY
      ORDER BY PROF

--MODULE 3 JOINS 
--*1.Display the names of the highest paid programmers for each Language.
     CREATE TABLE #PLangSal2(PROF VARCHAR(20), SAL INT)

      INSERT INTO #PLangSal2 
      SELECT PROF1, MAX(SALARY) AS HighestPay FROM programmer
      GROUP BY PROF1

      INSERT INTO #PLangSal2 
      SELECT PROF2, MAX(SALARY) AS HighestPay FROM programmer
      GROUP BY PROF2

      CREATE TABLE #PLangSalMax2(PROF VARCHAR(20), SAL INT)

      INSERT INTO #PLangSalMax2
      SELECT PROF, MAX(SAL) FROM #PLangSal GROUP BY PROF

      SELECT PNAME,PROF,SAL FROM programmer INNER JOIN #PLangSalMax2
      ON PROF=PROF1 OR PROF=PROF2
      WHERE SAL=SALARY
      ORDER BY PROF


--2. Display the details of those who are drawing the same salary.
     SELECT P. * FROM PROGRAMMER AS P  INNER JOIN (SELECT *  FROM PROGRAMMER) AS PP
	 ON P.PNAME = PP.PNAME WHERE P.SALARY IN 
	 (SELECT SALARY FROM PROGRAMMER  GROUP BY SALARY HAVING COUNT(SALARY) > 1) 
	 ORDER BY P.SALARY;
	

--3. Who are the programmers who joined on the same day?
     Select P.PNAME ,P.DOJ From Programmer AS P INNER JOIN (SELECT * FROM PROGRAMMER) AS PP ON
     P.PNAME = PP.PNAME WHERE P.DOJ IN (SELECT DOJ FROM PROGRAMMER GROUP BY DOJ
	 HAVING COUNT(DAY(DOJ))>1)
	 ORDER BY P.DOJ;
	 
--4. Who are the programmers who have the same Prof2?
     SELECT  P.PNAME,P.PROF2 FROM PROGRAMMER AS P INNER JOIN (SELECT * FROM PROGRAMMER) AS PP
	 ON P.PNAME = PP.PNAME WHERE P.PROF2 IN 
	 (SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(PROF2) > 1) ORDER BY P.PROF2 ;

	 
--5. How many packages were developed by the person who developed the cheapest package,
--   where did he/she study?
     Select COUNT(DEVELOPIN) AS COUNT_OF_DEV_PKG ,S.PNAME,S.DCOST,ST.INSTITUTE From Software AS S 
	 INNER JOIN STUDIES AS ST ON S.PNAME =ST.PNAME  GROUP BY S.PNAME,DCOST,INSTITUTE    HAVING 
	 DCOST = (SELECT MIN(DCOST) From  Software );
	 


--MODULE 4 FUNCTIONS ASSIGNMENT

--1 What is the Highest Number of copies sold by a Package?
    Select MAX(SOLD) AS HIGHEST_COPIES_SOLD from Software;

--2 Display lowest course Fee.
    Select MIN(COURSE_FEE) AS LOWEST_COURSE_FEE from Studies;

--3 How old is the Oldest Male Programmer.
    Select MAX((YEAR(GETDATE())-YEAR(DOB))) as OLDEST_MALE_PROGRAMMER From Programmer 
    where GENDER = 'M';
--OR
	Select MAX(DATEDIFF(YY,DOB,GETDATE())) From programmer Where GENDER='M';



--4 What is the AVG age of Female Programmers?
    Select AVG ((YEAR(GETDATE())-YEAR(DOB))) as AVG_AGE_OF_F From Programmer 
	where GENDER = 'F';
--or      
    Select AVG(DATEDIFF(YY,DOB,GETDATE())) From programmer Where GENDER='F';

/*5 Calculate the Experience in Years for each Programmer and Display with
    their names in Descending order.*/
	Select PNAME, YEAR(GETDATE()) - YEAR(DOJ) AS EXP  From PROGRAMMER 
	ORDER BY YEAR(GETDATE()) - YEAR(DOJ) DESC;
--or	 
    Select PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS experience From programmer 
	ORDER BY experience DESC;

--6 How many programmers have done the PGDCA Course?
    Select COUNT(PNAME) as No_of_Programmers from Studies where COURSE ='PGDCA';

--7 How much revenue has been earned thru sales of Packages Developed in C.
    SELECT PNAME, (SCOST*SOLD) as Revenue, DEVELOPIN from Software where DEVELOPIN='C';


--8 How many Programmers Studied at Sabhari?
    Select COUNT(PNAME) as No_of_Programmers from Studies where INSTITUTE ='SABHARI';
	
--9 How many Packages Developed in DBASE?
    Select COUNT(TITLE) as TOTAL_PKG_DEV FROM Software where DEVELOPIN = 'DBASE';

--10 How many programmers studied in Pragathi?
     Select count(PNAME) as INSTITUTE from Studies where INSTITUTE  = 'Pragathi';
 
--11 How many Programmers Paid 5000 to 10000 for their course?
     Select count(PNAME) as NO_OF_PROGRAMMERS  from Studies 
	 where COURSE_FEE between 5000 and 10000;

--12 How many Programmers know either COBOL or PASCAL?
     Select COUNT(PNAME) as PROGRAMMERS from Programmer  where PROF1='COBOL' OR PROF1='PASCAL'
	 OR PROF2='COBOL' OR PROF2='PASCAL';

--13 How many Female Programmers are there?
     Select COUNT(PNAME) as FEMALE_PROGRAMMERS from Programmer where GENDER = 'F';
  
  
--14 What is the AVG Salary?
     Select AVG(SALARY) as AVERAGE_SALARY from  Programmer;

--15 How many people draw salary 2000 to 4000?
     Select COUNT(SALARY) AS CNT  from  Programmer where SALARY between 2000 and 4000;

--16 Display the sales cost of the packages Developed by each Programmer Language wise
     SELECT PNAME, DEVELOPIN AS LANGUAGE , SUM(SCOST) AS SELLCOST FROM SOFTWARE 
	 GROUP BY PNAME,DEVELOPIN;

--17 Display the details of the software developed by the male students of Sabhari.
     
	 CREATE FUNCTION F1(@GENDER VARCHAR(20) , @INSTITUTE VARCHAR(20))  
	 RETURNS TABLE
	 RETURN
	 SELECT * FROM ( SELECT S.PNAME,S.TITLE,S.DEVELOPIN,S.SCOST,S.DCOST,
	 S.SOLD, GENDER ,INSTITUTE from Software AS S INNER JOIN Programmer AS P ON
	 S.PNAME = P.PNAME INNER JOIN Studies AS ST ON P.PNAME = ST.PNAME) AS P
	 WHERE GENDER = @GENDER AND INSTITUTE = @INSTITUTE
	 
	 SELECT * FROM F1('M','SABHARI');
	 
--OR	 
	 
	 SELECT S.*, GENDER ,INSTITUTE from Software AS S INNER JOIN Programmer AS P ON
	 S.PNAME = P.PNAME INNER JOIN Studies AS ST ON P.PNAME = ST.PNAME
	 WHERE GENDER = 'M' AND INSTITUTE = 'SABHARI';
	
--18 Who is the oldest Female Programmer who joined in 1992?
     Select PNAME,DOB,YEAR(DOJ) FROM Programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
    (Select MAX(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE YEAR(DOJ) ='1992');


--19 Who is the youngest male Programmer born in 1965?
     Select PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
     (Select MIN(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer 
	 WHERE  YEAR(DOB)=1965 AND GENDER='M');

--20 Which Package has the lowest selling cost?
      Select TITLE , SCOST from Software where 
	  SCOST = (SELECT MIN(SCOST) from Software ) ;

/*21 Which Female Programmer earning more than 3000 does not know C, C++,
     ORACLE or DBASE?*/
	
	CREATE FUNCTION F2(@GENDER VARCHAR(20))
	RETURNS TABLE 
	RETURN 
	SELECT * FROM ( Select * from Programmer where 
    SALARY > 3000
	AND (PROF1 NOT IN ('C', 'C++',  'ORACLE' , 'DBASE')
	AND PROF2 NOT IN ('C', 'C++',  'ORACLE' , 'DBASE'))) AS P
	WHERE GENDER = @GENDER

	SELECT * FROM F2('F');
	
--OR
     Select * from Programmer where GENDER = 'F' 
	 AND SALARY > 3000
	 AND (PROF1 NOT IN ('C', 'C++',  'ORACLE' , 'DBASE')
	 AND PROF2 NOT IN ('C', 'C++',  'ORACLE' , 'DBASE'));








--22 Who is the Youngest Programmer knowing DBASE?
     Select PNAME,DOB, YEAR(GETDATE()) - YEAR(DOB) AS AGE  From PROGRAMMER
	 Where  YEAR(GETDATE()) - YEAR(DOB) = (SELECT MIN(YEAR(GETDATE()) - YEAR(DOB))
	 From PROGRAMMER 
	 Where PROF1 = 'DBASE' OR PROF2 = 'DBASE');
--OR
	 Select PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE()) =
    (
     Select MIN(DATEDIFF(DD,DOB,GETDATE())) FROM programmer 
     WHERE 'DBASE' IN (PROF1,PROF2)
     );

  
--23 Which Language is known by only one Programmer?
     SELECT PROF1 AS LANGUAGE FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN
	 (SELECT PROF2 FROM PROGRAMMER ) AND COUNT(PROF1) = 1
	 UNION 
	 SELECT PROF2 AS LANGUAGE FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN
	 (SELECT PROF1 FROM PROGRAMMER ) AND COUNT(PROF2) = 1
	 
	 
--24 Who is the most experienced male programmer knowing PASCAL?
     SELECT DISTINCT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
     WHERE DATEDIFF(DD,DOJ,GETDATE()) = (SELECT MAX(DATEDIFF(DD,DOJ,GETDATE())) 
	 FROM programmer WHERE GENDER='M' AND PROF1='PASCAL' OR PROF2='PASCAL');

--OR
     SELECT  DISTINCT PNAME,(YEAR(GETDATE()) - YEAR(DOJ)) AS EXPERIENCE
	 FROM PROGRAMMER  WHERE (YEAR(GETDATE()) - YEAR(DOJ)) =
	 (SELECT MAX(YEAR(GETDATE()) - YEAR(DOJ)) FROM PROGRAMMER WHERE 
	 GENDER='M' AND PROF1='PASCAL' OR PROF2='PASCAL');


--25 Who is the least experienced Programmer?
     Select PNAME, YEAR(GETDATE()) - YEAR(DOJ) AS EXP ,PROF1,PROF2 From PROGRAMMER
	 Where  YEAR(GETDATE()) - YEAR(DOJ) = (SELECT MIN(YEAR(GETDATE()) - YEAR(DOJ))
	 From PROGRAMMER );
--OR
	 SELECT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
     WHERE DATEDIFF(YY,DOJ,GETDATE()) = (SELECT MIN(DATEDIFF(YY,DOJ,GETDATE()))
	 FROM programmer);



	 
/*26 Display the Number of Packages in Each Language for which Development Cost is less
     than 1000.*/
	 Select COUNT(TITLE) AS NO_OF_PACKEGES , DEVELOPIN AS LANGUAGE FROM Software 
	 where DCOST < 1000
	 group by DEVELOPIN ;

--27 Display Highest, Lowest and Average Salaries for those earning more than 2000
     Select MAX(SALARY) AS HIGHEST_SALARY , MIN(SALARY) AS LOWEST_SALARY , 
	 AVG(SALARY) AS AVG_SALARY from Programmer
	 where SALARY > 2000;

--MODULE 5 OPTIMISATION AND PERFORMANCE ASSIGNMENT
--1. How many Programmers Don’t know PASCAL and C
     CREATE VIEW PR
	 AS
	 SELECT PNAME ,PROF1 , PROF2 FROM PROGRAMMER WHERE PNAME IN 
	 (SELECT PNAME FROM PROGRAMMER WHERE PROF1 NOT IN ('C' , 'PASCAL')
	 AND PROF2 NOT IN  ('C' , 'PASCAL'))
	 
	 SELECT *  FROM  PR;

	


--2. Display the details of those who don’t know Clipper, COBOL or PASCAL.
     CREATE VIEW PR1
	 AS
	 SELECT PNAME ,PROF1 ,PROF2,DOB,DOJ,SALARY FROM PROGRAMMER WHERE PNAME IN 
	 (SELECT PNAME FROM PROGRAMMER WHERE PROF1 NOT IN ('CLIPPER', 'COBOL' , 'PASCAL')
	 AND PROF2 NOT IN  ('CLIPPER', 'COBOL' , 'PASCAL'))
	 
	 SELECT *  FROM  PR1 ;
	 
---OR---USING CTE

	   WITH T13(PNAME ,PROF1 ,PROF2,DOB,DOJ,SALARY)
	   AS(SELECT PNAME ,PROF1 ,PROF2,DOB,DOJ,SALARY FROM PROGRAMMER WHERE PNAME IN 
	   (SELECT PNAME FROM PROGRAMMER))
	   SELECT * FROM T13 WHERE 
	   PROF1 NOT IN ('CLIPPER', 'COBOL' , 'PASCAL')
	   AND PROF2 NOT IN  ('CLIPPER', 'COBOL' , 'PASCAL');




/*3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price
     per Copy.*/
	 CREATE VIEW PR2     
     AS
     SELECT  DEVELOPIN AS LANGUAGE , AVG(DCOST) AS AVG_DEV_COST,AVG(SCOST) AS AVG_SELL_COST,
     IIF(SUM(SOLD)<>0,sum(SCOST)/sum(SOLD),0) AS AVGS_PRICE_PER_COPY FROM SOFTWARE
	 WHERE SOLD>=1
     GROUP BY  DEVELOPIN

     SELECT * FROM PR2;

/*4. List the programmer names (from the programmer table) and No. Of Packages each has
     developed.*/
	
	 CREATE VIEW PR3
     AS 
     SELECT P.PNAME , COUNT(TITLE) AS NO_OF_PKG_DEV FROM SOFTWARE AS S INNER JOIN 
     PROGRAMMER AS P ON P.PNAME = S.PNAME GROUP BY P.PNAME

     SELECT * FROM PR3;

 ---OR--USING CTE

    WITH T12(PNAME , TITLE)
	AS (SELECT P.PNAME , COUNT(TITLE) AS NO_OF_PKG_DEV FROM SOFTWARE AS S INNER JOIN 
         PROGRAMMER AS P ON P.PNAME = S.PNAME GROUP BY P.PNAME)
    SELECT * FROM T12;


	/*5. List each PROFIT with the number of Programmers having that PROF and the number of the
     packages in that PROF.*/
	
	 CREATE VIEW VI
	 AS
	 SELECT DEVELOPIN,sum(SCOST*SOLD-DCOST) AS PROFIT, COUNT(1) AS PROG_CNT from Software 
     WHERE DEVELOPIN IN 
     ((SELECT PROF1 FROM Programmer) UNION ALL (SELECT PROF2 FROM Programmer))
     GROUP BY DEVELOPIN;

     SELECT * FROM VI;


	






--6. How many packages are developed by the most experienced programmer form BDPS.  
	 SELECT PNAME, COUNT(TITLE) FROM software WHERE PNAME IN
    (
	 SELECT PG.PNAME FROM programmer PG 
	 WHERE DATEDIFF(YY,DOJ,GETDATE())= (SELECT MAX(DATEDIFF(YY,DOJ,GETDATE())) FROM programmer
	 P, STUDIES T WHERE P.PNAME=T.PNAME AND T.INSTITUTE='BDPS' ) 
    )
     GROUP BY PNAME;

/*7. How many packages were developed by the female programmers earning more than the
     highest paid male programmer?*/
	 CREATE VIEW V4 
	 AS 
	 SELECT COUNT(TITLE) AS NO_OF_PKGS FROM PROGRAMMER AS P INNER JOIN SOFTWARE AS S ON
	 P.PNAME = S.PNAME WHERE GENDER = 'F' AND 
	 SALARY > (SELECT MAX ( SALARY )FROM PROGRAMMER WHERE GENDER = 'M' )

	 SELECT * FROM V4;
	 
	



./*8. How much does the person who developed the highest selling package earn and what course
      did HE/SHE undergo.*/
	  CREATE VIEW V5
	  AS 
	  SELECT P.PNAME,ST.COURSE,SALARY,S.SOLD AS HIGHEST_SELLING FROM PROGRAMMER AS P
	  INNER JOIN SOFTWARE AS S ON
	  P.PNAME = S.PNAME INNER JOIN STUDIES AS ST ON ST.PNAME = S.PNAME
	  WHERE SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER) AND 
	  S.SOLD =(SELECT MAX(SOLD) FROM SOFTWARE)

	  SELECT * FROM V5;

----OR---USING CTE 

	  WITH T11( PNAME,COURSE,SALARY,SOLD)
	  AS ( SELECT P.PNAME,ST.COURSE,SALARY,S.SOLD AS HIGHEST_SELLING FROM PROGRAMMER AS P
	  INNER JOIN SOFTWARE AS S ON
	  P.PNAME = S.PNAME INNER JOIN STUDIES AS ST ON ST.PNAME = S.PNAME)
	  SELECT * FROM T11 WHERE SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER) AND 
	  SOLD =(SELECT MAX(SOLD) FROM SOFTWARE);

	 





--9. In which institute did the person who developed the costliest package study?
     CREATE VIEW V6   
	 AS
	 SELECT INSTITUTE , DCOST,ST.PNAME FROM STUDIES AS ST INNER JOIN SOFTWARE AS S ON
	 ST.PNAME = S.PNAME GROUP BY INSTITUTE , DCOST,ST.PNAME
	 HAVING DCOST IN  (SELECT MAX(DCOST) FROM SOFTWARE)

	 SELECT * FROM V6;

----OR---USING CTE

	 WITH T10(INSTITUTE,DCOST,PNAME)
	 AS( SELECT INSTITUTE , DCOST,ST.PNAME FROM STUDIES AS ST INNER JOIN SOFTWARE AS S ON
	 ST.PNAME = S.PNAME GROUP BY INSTITUTE , DCOST,ST.PNAME)
	 SELECT * FROM T10 WHERE DCOST IN  (SELECT MAX(DCOST) FROM SOFTWARE);


	



--10.Display the names of the programmers who have not developed any packages.
     CREATE VIEW V7
	 AS
	 Select PNAME from Programmer where PNAME NOT IN (Select PNAME from Software )
	  
	 SELECT * FROM V7;
	 
----OR----USING CTE
      WITH T9(PNAME)
	  AS( Select PNAME from Programmer)
	  SELECT * FROM T9 WHERE PNAME NOT IN (Select PNAME from Software );

/*11. Display the details of the software that has developed in the language which is neither the
      first nor the second proficiency*/
	
	  CREATE VIEW V
	  AS
      SELECT SW.*,PG.PROF1,PG.PROF2 from Software AS SW, programmer AS PG 
      WHERE PG.PROF1 <> SW.DEVELOPIN AND PG.PROF2 <> SW.DEVELOPIN AND PG.PNAME = SW.PNAME

	  SELECT * FROM V;

/*12. Display the details of the software Developed by the male programmers Born before 1965
      and female programmers born after 1975*/
	  CREATE VIEW V9
	  AS
	  SELECT S.PNAME,S.TITLE,S.DEVELOPIN,S.SCOST,S.DCOST,
	  S.SOLD,P.GENDER,P.DOB FROM SOFTWARE AS S INNER JOIN PROGRAMMER AS  P ON 
	  S.PNAME = P.PNAME 
	  WHERE                                              
	  GENDER = 'M' AND YEAR(DOB) < '1965' OR GENDER = 'F' AND YEAR(DOB) > '1975'
	 
	  SELECT * FROM V9;

-----OR---USING CTE

	  WITH T8(PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD,GENDER,DOB )
	  AS (  SELECT S.PNAME,S.TITLE,S.DEVELOPIN,S.SCOST,S.DCOST,
	  S.SOLD,P.GENDER,P.DOB FROM SOFTWARE AS S INNER JOIN PROGRAMMER AS  P ON 
	  S.PNAME = P.PNAME )
	  SELECT * FROM T8 WHERE GENDER = 'M' AND YEAR(DOB) < '1965' OR GENDER = 'F'
	  AND YEAR(DOB) > '1975';
	 
	 
/*13. Display the number of packages, No. of Copies Sold and sales value of each programmer
      institute wise.*/	  CREATE VIEW V10          	  AS	  SELECT INSTITUTE, COUNT(SW.TITLE) AS PKGCNT, sum(SW.SOLD) AS SALESCNT, SUM(SCOST*SOLD) AS SALVAL
      FROM software AS SW, studies AS ST 
      WHERE SW.PNAME=ST.PNAME
      GROUP BY INSTITUTE 
	 
	  SELECT * FROM V10;


 /*14. Display the details of the Software Developed by the Male Programmers Earning More than
      3000 */
	  CREATE VIEW V11
	  AS
	  SELECT S.PNAME,S.TITLE,S.DEVELOPIN,S.SCOST,S.DCOST,S.SOLD,P.GENDER,P.SALARY
	  FROM SOFTWARE AS S INNER JOIN PROGRAMMER AS P ON S.PNAME = P.PNAME 
	  WHERE SALARY > 3000 AND GENDER = 'M'

	  SELECT * FROM V11;
------OR

	  CREATE PROCEDURE PRCE @GENDER VARCHAR(23) -- DROP PROCEDURE  PRCE
	  AS
      SELECT * FROM ( SELECT S.PNAME,S.TITLE,S.DEVELOPIN,S.SCOST,
                 S.DCOST,S.SOLD,P.GENDER,P.SALARY
	           FROM SOFTWARE AS S INNER JOIN PROGRAMMER AS P ON S.PNAME = P.PNAME 
	           WHERE SALARY > 3000 ) AS P WHERE GENDER = @GENDER

      EXEC  PRCE @GENDER = 'M'
    
--15. Who are the Female Programmers earning more than the Highest Paid male?
      CREATE VIEW V12
	  AS
	  Select PNAME , SALARY from Programmer where GENDER = 'F' AND 
	  SALARY > (Select MAX(SALARY) From Programmer where GENDER = 'M')

	  SELECT * FROM V12;

	 
-----OR---USING CTE

	  WITH T7 (PNAME , SALARY,GENDER)
	  AS(Select PNAME , SALARY,GENDER from Programmer)
	  SELECT * FROM T7 WHERE GENDER = 'F' AND 
	  SALARY > (Select MAX(SALARY) From Programmer where GENDER = 'M');

--16. Who are the male programmers earning below the AVG salary of Female Programmers?
      CREATE VIEW V13
	  AS
	  Select PNAME,SALARY From Programmer where GENDER = 'M' AND
	  SALARY < ( Select AVG(SALARY) From Programmer where GENDER = 'F') 

	  SELECT * FROM V13;

-----OR---USING CTE

	 WITH T6(PNAME,SALARY, GENDER)
	 AS ( Select PNAME,SALARY,GENDER From Programmer)
	 SELECT * FROM T6 WHERE GENDER = 'M' AND
	 SALARY < ( Select AVG(SALARY) From Programmer where GENDER = 'F');

/*17. Display the language used by each programmer to develop the Highest Selling and
      Lowest-selling package.*/
	  CREATE VIEW VA
	  AS
	  SELECT PNAME, DEVELOPIN FROM Software 
      WHERE SOLD IN (SELECT MAX(SOLD) FROM Software) UNION 
      SELECT PNAME, DEVELOPIN FROM Software WHERE SOLD IN 
     (SELECT MIN(SOLD) FROM Software);

	  SELECT * FROM VA;


--18. Display the names of the packages, which have sold less than the AVG number of copies.
      
	  CREATE VIEW V30  
	  AS
	  Select TITLE,SOLD from Software where
	  SOLD < (Select AVG(SOLD) from Software )

	  SELECT * FROM V30;

--19. Which is the costliest package developed in PASCAL.
      CREATE VIEW V14           
	  AS 
	  Select TITLE from Software where DCOST = 
	 (Select MAX(DCOST) from Software where
	  DEVELOPIN = 'PASCAL')

	  SELECT * FROM V14;

/*20. How many copies of the package that has the least difference between development and
      selling cost were sold.*/
	  CREATE VIEW V15   
	  AS
	  SELECT TITLE, DEVELOPIN, SOLD, (DCOST-SCOST) as Least_Difference from Software
      where DCOST-SCOST = (Select MIN(DCOST-SCOST) from Software)

	  SELECT * FROM V15;



----OR---USING CTE
      WITH T5(TITLE, DEVELOPIN, SOLD, DCOST,SCOST)
	  AS (SELECT TITLE, DEVELOPIN, SOLD, DCOST,SCOST  from Software)
	  SELECT * FROM T5 WHERE DCOST-SCOST = (Select MIN(DCOST-SCOST) from Software);

/*21. Which language has been used to develop the package, which has the highest sales
      amount?*/
	  CREATE VIEW  V16     
	  AS
	  Select PNAME,DEVELOPIN ,SCOST  from Software where 
	  SCOST = (Select MAX(SCOST) from Software ) 

	  SELECT * FROM  V16;
	 
--22. Who Developed the Package that has sold the least number of copies?
      CREATE VIEW  V17
	  AS
	  Select PNAME , SOLD From Software where
	  SOLD = (SELECT MIN(SOLD) from Software )

	  SELECT * FROM  V17;
-----OR----USING CTE
      WITH T4(PNAME , SOLD)
	  AS ( Select PNAME , SOLD From Software)
	  SELECT * FROM T4 WHERE SOLD = (SELECT MIN(SOLD) from Software );

--23. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
      CREATE VIEW V18
	  AS
	  Select COURSE,COURSE_FEE from studies where 
	  COURSE_FEE < (Select AVG(COURSE_FEE)+1000 From Studies)
	  AND COURSE_FEE  > (Select AVG(COURSE_FEE)-1000 From Studies)

	  SELECT * FROM V18;

------OR-----USING CTE

	  WITH  T3(COURSE,COURSE_FEE)
	  AS (Select COURSE,COURSE_FEE from studies)
	  SELECT * FROM T3 WHERE  COURSE_FEE < (Select AVG(COURSE_FEE)+1000 From Studies)
	                          AND COURSE_FEE  > (Select AVG(COURSE_FEE)-1000 From Studies);

--24. Display the name of the Institute and Course, which has below AVG course fee. 
      CREATE VIEW V19
	  AS 
	  Select INSTITUTE , COURSE,COURSE_FEE from studies 
	  where COURSE_FEE < (Select AVG(COURSE_FEE) FROM Studies )

	  SELECT * FROM V19;

------OR-----USING CTE
      WITH T2( INSTITUTE , COURSE,COURSE_FEE)
	  AS (  Select INSTITUTE , COURSE,COURSE_FEE from studies )
	  SELECT * FROM T2 WHERE COURSE_FEE < (Select AVG(COURSE_FEE) FROM Studies );


--25. Which Institute conducts costliest course.
      CREATE VIEW V20
	  AS
	  Select INSTITUTE  from Studies where 
	  COURSE_FEE = (Select MAX(COURSE_FEE) FROM Studies)

	  SELECT * FROM V20;

	  -----OR----USING CTE

	  WITH T1(INSTITUTE,COURSE_FEE)
	  AS ( Select INSTITUTE,COURSE_FEE  from Studies)
	  SELECT * FROM T1 WHERE  COURSE_FEE = (Select MAX(COURSE_FEE) FROM Studies);

--26. What is the Costliest course?
      CREATE VIEW V21
	  AS
	  Select COURSE from Studies where
	  COURSE_FEE = (Select MAX( COURSE_FEE) FROM Studies)

	  SELECT * FROM V21;

-------OR-----USING CTE

	  WITH T(COURSE,COURSE_FEE)
	  AS (  Select COURSE,COURSE_FEE from Studies )
	  SELECT * FROM T WHERE  COURSE_FEE = (Select MAX( COURSE_FEE) FROM Studies);


--1. Display the details of the software developed in DBASE by Male Programmers, who belong
--to the institute in which most number of Programmer
  CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

  INSERT INTO #INST
  SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

  SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
  WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
  AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST)



--2. In which language are most of the programmer’s proficient?
CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)

    SELECT * FROM #PCNT
--3. In which month did the most number of programmers join?
    -- MAX(COUNT(PNAME)),MONTH(DOJ)

  CREATE TABLE #MNTH (DOJ INT, CNT INT)  

  INSERT INTO #MNTH
  SELECT MONTH(DOJ), COUNT(PNAME) FROM Programmer GROUP BY MONTH(DOJ)   

  SELECT DOJ AS MONTH_OF_DOJ,CNT AS_THE_NO_OF_STD FROM #MNTH 
  WHERE CNT IN (SELECT MAX(CNT) FROM #MNTH)



--4. In which year was the most number of Programmers born.
     --YEAR(DOB),CNT(PNAME)

   CREATE TABLE #YEAR (DOB INT, CNT INT)  

   INSERT INTO #YEAR
   SELECT YEAR(DOB), COUNT(PNAME) FROM Programmer GROUP BY YEAR(DOB)

   SELECT DOB AS YEAR_OF_DOB,CNT AS_THE_NO_OF_STD FROM #YEAR
   WHERE CNT IN (SELECT MAX(CNT) FROM #YEAR)


--5. Which programmer has developed the highest number of Packages?
    -- PNAME,COUNT(TITLE)

   CREATE TABLE #PS (PSNAME VARCHAR(20) , CNT INT)  

   INSERT INTO  #PS 
   SELECT PNAME , COUNT(TITLE) FROM SOFTWARE GROUP BY PNAME

   SELECT PSNAME AS PROGRAMMER , CNT AS NO_OF_PKGS FROM #PS 
   WHERE CNT IN (SELECT MAX(CNT) FROM #PS)

 
--6. Which language was used to develop the most number of Packages.
   
   CREATE TABLE #PCN (PR VARCHAR(20), CNT INT)    --DROP TABLE #PCN
CREATE TABLE #PsCN (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCN
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCN
SELECT PR, SUM(CNT) FROM #PCN GROUP BY PR

  SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG,#PCN , #PsCN
  WHERE SW.PNAME = PG.PNAME AND CNT= (SELECT MAX(CNT) FROM #PsCN)

  SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
  WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
  AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST )



  SELECT * FROM Software













SELECT * FROM SOFTWARE

--7. Which course has below average number of Students?
     CREATE TABLE #AVGCNT (CRS VARCHAR(20), CNT INT)

    INSERT INTO #AVGCNT
    SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE

    SELECT CRS,CNT FROM #AVGCNT WHERE CNT <=
   (SELECT AVG(CNT) FROM #AVGCNT)

--8. Which course has been done by the most of the Students?  
     --COURSE,CNT(PNAME)

   CREATE TABLE #ST (CRSE VARCHAR(20) , CNT INT)  

   INSERT INTO  #ST 
   SELECT COURSE ,COUNT(PNAME) FROM STUDIES GROUP BY COURSE

   SELECT CRSE AS COURSE , CNT AS NO_OF_STDS FROM #ST
   WHERE CNT IN (SELECT MAX(CNT) FROM #ST)


--9. Which Institute has the most number of Students?
    --INSTITUTE,COUNT(PNAME)  
  CREATE TABLE #INSTITUTE (INS VARCHAR(20), CNT INT)

  INSERT INTO #INSTITUTE
  SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

   SELECT INS AS INSTITUTE , CNT AS NO_OF_STDS FROM  #INSTITUTE
   WHERE CNT IN (SELECT MAX(CNT) FROM #INSTITUTE)


--10. Who is the Above Programmer Referred in 50?
--11. Display the names of the highest paid programmers for each Language
     --PNAME , MAX(SALARY),PROF1 , PROF2 
	 CREATE TABLE #PCNTT (PR VARCHAR(20), CNT INT )       --=DROP TABLE  #PsCNTT 
     CREATE TABLE #PsCNTT (PRs VARCHAR(20), sCNT INT)

     INSERT INTO #PCNTT
     SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
     SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

     INSERT INTO #PsCNTT
     SELECT PR, SUM(CNT) FROM #PCNTT GROUP BY PR





	 SELECT * FROM PROGRAMMER


SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)




--61. Which course has below AVG number of Students?
CREATE TABLE #AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO #AVGCNT
SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CRS,CNT FROM #AVGCNT WHERE CNT <=
(SELECT AVG(CNT) FROM #AVGCNT)


--QUERY 78. In which language are most of the programmer’s proficient.
CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)


--QUERY 88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

INSERT INTO #INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST)


--QUERY 90. Display the details of the software that has developed in the language
--         which is neither the first nor the second proficiency of the programmers.
SELECT SW.*,PG.PROF1,PG.PROF2 from Software AS SW, programmer AS PG 
WHERE PG.PROF1 <> SW.DEVELOPIN AND PG.PROF2 <> SW.DEVELOPIN AND PG.PNAME = SW.PNAME