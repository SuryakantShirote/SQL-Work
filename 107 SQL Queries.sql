--Tasks to be performed:
--1. Find out the selling cost AVG for packages developed in Pascal.
SELECT AVG(SCOST) FROM software WHERE DEVELOPIN='PASCAL'


--2. Display Names, Ages of all Programmers.

SELECT PNAME AS NAME, DATEDIFF(YY,DOB,GETDATE()) AS AGE FROM programmer


--3. Display the Names of those who have done the DAP Course.
SELECT PNAME, COURSE FROM studies WHERE COURSE='DAP'


--4. Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME AS NAME, DOB FROM programmer WHERE MONTH(DOB)=1


--5. What is the Highest Number of copies sold by a Package?
SELECT MAX(SOLD) FROM SOFTWARE


--6. Display lowest course Fee.
SELECT MIN(COURSE_FEE) FROM studies


--7. How many programmers done the PGDCA Course?
SELECT COUNT(PNAME) FROM studies WHERE COURSE='PGDCA'


--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) FROM software WHERE DEVELOPIN='C'


--9. Display the Details of the Software Developed by Ramesh.
SELECT * FROM software WHERE PNAME='RAMESH'


--10. How many Programmers Studied at Sabhari?
SELECT COUNT(1) FROM studies WHERE INSTITUTE='SABHARI'


--11. Display details of Packages whose sales crossed the 2000 Mark
SELECT TITLE, SUM(SCOST*SOLD) AS TOTAL_REVENUE FROM software 
GROUP BY TITLE HAVING SUM(SCOST*SOLD)>2000


--12. Display the Details of Packages for which Development Cost have been recovered.
SELECT * FROM software WHERE (SCOST*SOLD)>DCOST


--13. What is the cost of the costliest software development in Basic?
SELECT TITLE, MAX(SCOST) 
FROM software WHERE DEVELOPIN='BASIC'
GROUP BY TITLE 


--14. How many Packages Developed in DBASE?
SELECT COUNT(1) FROM software WHERE DEVELOPIN='DBASE'


--15. How many programmers studied in Pragathi?
SELECT COUNT(1) FROM studies WHERE INSTITUTE='PRAGATHI'


--16. How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(1) FROM studies WHERE COURSE_FEE BETWEEN 5000 AND 10000



--17. What is AVG Course Fee
SELECT AVG(COURSE_FEE) FROM studies



--18. Display the details of the Programmers Knowing C.
SELECT * FROM programmer WHERE PROF1='C' OR PROF2='C'



--19. How many Programmers know either COBOL or PASCAL.
SELECT COUNT(1) FROM programmer WHERE PROF1='COBOL' OR PROF1='PASCAL' OR PROF2='COBOL' OR PROF2='PASCAL'



--20. How many Programmers Don’t know PASCAL and C
SELECT * FROM programmer WHERE NOT (PROF1='PASCAL' AND PROF2='C' OR PROF2='PASCAL' AND PROF1='C')




--21. How old is the Oldest Male Programmer.

SELECT MAX(DATEDIFF(YY,DOB,GETDATE())) FROM programmer WHERE GENDER='M'




--22. What is the AVG age of Female Programmers?

SELECT AVG(DATEDIFF(YY,DOB,GETDATE())) FROM programmer WHERE GENDER='F'


--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

SELECT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS experience FROM programmer ORDER BY experience DESC



--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?

SELECT PNAME FROM programmer WHERE MONTH(DOB)=MONTH(GETDATE())



--25. How many Female Programmers are there?

SELECT COUNT(1) FROM programmer WHERE GENDER='F'



--26. What are the Languages studied by Male Programmers.

SELECT PNAME,PROF1,PROF2 FROM programmer WHERE GENDER='M'



--27. What is the AVG Salary?

SELECT AVG(SALARY) FROM programmer



--28. How many people draw salary 2000 to 4000?

SELECT COUNT(1) FROM programmer WHERE SALARY BETWEEN 2000 AND 4000



--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.

SELECT * FROM programmer WHERE 
'CLIPPER' NOT IN (PROF1,PROF2) AND   
'COBOL' NOT IN (PROF1,PROF2) AND     
'PASCAL' NOT IN (PROF1,PROF2)



--30. Display the Cost of Package Developed By each Programmer.

SELECT PNAME, SUM(DCOST) AS TotalPackageCost FROM software GROUP BY PNAME



--31. Display the sales values of the Packages Developed by the each Programmer.

SELECT PNAME, SUM(SCOST*SOLD) AS TotalSales FROM software GROUP BY PNAME



--32. Display the Number of Packages sold by Each Programmer.

SELECT PNAME,SUM(SOLD) AS TotalSold FROM software GROUP BY PNAME



--33. Display the sales cost of the packages Developed by each Programmer Language wise

SELECT PNAME,DEVELOPIN, SUM(SCOST) AS	TotalbyLang FROM software GROUP BY PNAME,DEVELOPIN



--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.

SELECT DEVELOPIN, AVG(DCOST) AS AvgDevCost, AVG(SCOST) AS AvgSellCost 
,IIF(SUM(SOLD)<>0,sum(SCOST)/sum(SOLD),0) AS AvgPrCopy
FROM software GROUP BY DEVELOPIN



--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.

SELECT PNAME, MAX(DCOST) AS Costliest, MIN(DCOST) AS Cheapest FROM software GROUP BY PNAME



--36. Display each institute name with number of Courses, Average Cost per Course.
SELECT INSTITUTE, COUNT(COURSE) AS NumCourses, AVG(COURSE_FEE) AS AvgCostbyCourse
FROM studies GROUP BY INSTITUTE

--37. Display each institute Name with Number of Students.
SELECT INSTITUTE, COUNT(PNAME) AS StudCount FROM studies GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also.
SELECT PNAME,GENDER FROM programmer GROUP BY GENDER,PNAME

--39. Display the Name of Programmers and Their Packages.
SELECT PNAME,TITLE FROM software GROUP BY PNAME,TITLE

--40. Display the Number of Packages in Each Language Except C and C++.
SELECT DEVELOPIN, COUNT(TITLE) AS PkgCnt FROM software 
WHERE DEVELOPIN NOT IN ('C','CPP') GROUP BY DEVELOPIN

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT DEVELOPIN, COUNT(TITLE) AS PkgCnt FROM software
WHERE DCOST<1000 GROUP BY DEVELOPIN

--42. Display AVG Difference between SCOST, DCOST for Each Package.
SELECT TITLE, AVG(DCOST) AS AVGDCOST, AVG(SCOST) AS AVGSCOST, AVG(DCOST)-AVG(SCOST) AS AVGCOSTDIFF
FROM software GROUP BY TITLE

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
SELECT PNAME, SUM(DCOST) AS SumDCOST, SUM(SCOST*SOLD) AS SumSCOST, SUM(SCOST*SOLD)-SUM(DCOST) AS SumDiffCOST
FROM software GROUP BY PNAME HAVING SUM(SCOST*SOLD)<SUM(DCOST)

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT MAX(SALARY) AS HighSal, MIN(SALARY) AS MinSal, AVG(SALARY) AS AvgSal FROM programmer WHERE SALARY>2000

--45. Who is the Highest Paid C Programmers?
SELECT TOP 1 * FROM programmer WHERE 'C' IN (PROF1,PROF2)
ORDER BY SALARY DESC

--46. Who is the Highest Paid Female COBOL Programmer?
SELECT TOP 1 * FROM programmer WHERE 'COBOL' IN (PROF1,PROF2) AND GENDER='F'
ORDER BY SALARY DESC

--47. Display the names of the highest paid programmers for each Language.
--------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------
	
--48. Who is the least experienced Programmer.
SELECT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
WHERE DATEDIFF(YY,DOJ,GETDATE()) = (SELECT MIN(DATEDIFF(YY,DOJ,GETDATE()))FROM programmer)

--49. Who is the most experienced male programmer knowing PASCAL.
SELECT DISTINCT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
WHERE DATEDIFF(DD,DOJ,GETDATE()) = (SELECT MAX(DATEDIFF(DD,DOJ,GETDATE())) FROM programmer WHERE GENDER='M' AND PROF1='PASCAL' OR PROF2='PASCAL')

--50. Which Language is known by only one Programmer?
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

--51. Who is the Above Programmer Referred in 50?

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

--52. Who is the Youngest Programmer knowing DBASE?
SELECT PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE()) =
(
SELECT MIN(DATEDIFF(DD,DOB,GETDATE())) FROM programmer 
WHERE 'DBASE' IN (PROF1,PROF2)
)

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT * FROM programmer WHERE SALARY>3000 AND GENDER='F' AND
PROF1 NOT IN ('C','CPP','ORACLE','DBASE') AND PROF2 NOT IN ('C','CPP','ORACLE','DBASE')

--54. Which Institute has most number of Students?
CREATE TABLE #InstStudNo (InsNam VARCHAR(20), StdNo INT)

INSERT INTO #InstStudNo
SELECT INSTITUTE,COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT InsNam,StdNo AS COUNT_OF_STUDENTS FROM #InstStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM #InstStudNo)

--55. What is the Costliest course?
SELECT COURSE, COURSE_FEE FROM studies
WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM studies)

--56. Which course has been done by the most of the Students?
CREATE TABLE #CourStudNo (CourNam VARCHAR(20), StdNo INT)

INSERT INTO #CourStudNo
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CourNam,StdNo AS COUNT_OF_STUDENTS FROM #CourStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM #CourStudNo)

--57. Which Institute conducts costliest course.
SELECT INSTITUTE,COURSE_FEE FROM studies
WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM studies)

--58. Display the name of the Institute and Course, which has below AVG course fee.
SELECT INSTITUTE, COURSE, COURSE_FEE FROM Studies
WHERE COURSE_FEE< (SELECT AVG(COURSE_FEE) FROM Studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
SELECT COURSE, COURSE_FEE FROM studies WHERE 
COURSE_FEE<(SELECT AVG (COURSE_FEE)+1000 FROM Studies) AND COURSE_FEE> (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES)

--60. Which package has the Highest Development cost?
SELECT TITLE, DCOST FROM software WHERE DCOST = 
(SELECT MAX(DCOST) FROM software)

--61. Which course has below AVG number of Students?
CREATE TABLE #AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO #AVGCNT
SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CRS,CNT FROM #AVGCNT WHERE CNT <=
(SELECT AVG(CNT) FROM #AVGCNT)

--62. Which Package has the lowest selling cost?
SELECT PNAME,TITLE, SCOST FROM software WHERE SCOST=
(SELECT MIN(SCOST) FROM Software)

--63. Who Developed the Package that has sold the least number of copies?
SELECT PNAME, TITLE, SOLD FROM software
WHERE SOLD=(SELECT MIN(SOLD) FROM software)

--64. Which language has used to develop the package, which has the highest sales amount?
SELECT PNAME, DEVELOPIN , SCOST FROM Software
WHERE SCOST =(SELECT MAX(SCOST) FROM Software)

--65. How many copies of package that has the least difference between development and selling cost were sold.
SELECT TITLE, SOLD, DCOST-SCOST as LEAST_DIFFCOST FROM Software
WHERE DCOST-SCOST= (SELECT MIN( DCOST-SCOST)FROM Software)

--66. Which is the costliest package developed in PASCAL.
SELECT TITLE, DCOST, DEVELOPIN FROM Software
WHERE  DCOST=(SELECT MAX(DCOST) FROM Software WHERE DEVELOPIN='PASCAL')

--67. Which language was used to develop the most number of Packages.
CREATE TABLE #DEVCNT (LANG VARCHAR(20), CNT INT)

INSERT INTO #DEVCNT
SELECT DEVELOPIN, COUNT(TITLE) FROM software GROUP BY DEVELOPIN

SELECT LANG, CNT FROM #DEVCNT WHERE CNT=
(SELECT MAX(CNT) FROM #DEVCNT)

--68. Which programmer has developed the highest number of Packages?
CREATE TABLE #PRGCNT (PN VARCHAR(20), CNT INT)

INSERT INTO #PRGCNT
SELECT PNAME, COUNT(TITLE) FROM software GROUP BY PNAME

SELECT PN, CNT FROM #PRGCNT WHERE CNT=
(SELECT MAX(CNT) FROM #PRGCNT)

--QUERY 69. Who is the Author of the Costliest Package?
SELECT PNAME, DCOST FROM Software
WHERE DCOST= (SELECT MAX(DCOST)FROM Software)

--QUERY 70. Display the names of the packages, which have sold less than the AVG number of copies.
SELECT TITLE,SOLD FROM Software
WHERE SOLD<(SELECT AVG(SOLD) FROM Software)

--QUERY 71. Who are the authors of the Packages, which have recovered more than double the Development cost?
SELECT PNAME, TITLE FROM Software WHERE SOLD*SCOST> 2*DCOST;

--QUERY 73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT PNAME, DEVELOPIN, 'HIGHEST' FROM Software 
WHERE SOLD IN (SELECT MAX(SOLD) FROM Software) UNION 
SELECT PNAME, DEVELOPIN, 'LOWEST' FROM Software WHERE SOLD IN 
(SELECT MIN(SOLD) FROM Software);

--QUERY 74. Who is the youngest male Programmer born in 1965?
SELECT PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MIN(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE  year(DOB)=1965 AND GENDER='M')

--QUERY 75. Who is the oldest Female Programmer who joined in 1992?
SELECT PNAME,DOB,YEAR(DOJ) FROM Programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MAX(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE YEAR(DOJ) ='1992');

--QUERY 76. In which year was the most number of Programmers born.
CREATE TABLE #TEMP (YOB INT, CNT INT)

INSERT INTO #TEMP
SELECT YEAR(DOB),COUNT(pname) FROM programmer GROUP BY YEAR(DOB)

SELECT YOB, CNT FROM #TEMP WHERE CNT= (SELECT MAX(CNT) FROM #TEMP)

--QUERY 77. In which month did most number of programmers join?
CREATE TABLE #MOJ (MOJ INT, CNT INT)

INSERT INTO #MOJ
SELECT MONTH(DOJ),COUNT(pname) FROM programmer GROUP BY MONTH(DOJ)

SELECT MOJ, CNT FROM #MOJ WHERE CNT= (SELECT MAX(CNT) FROM #MOJ)

--QUERY 78. In which language are most of the programmer’s proficient.
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

--QUERY 79. Who are the male programmers earning below the AVG salary of Female Programmers?
SELECT PNAME, SALARY FROM Programmer WHERE GENDER = 'M' AND SALARY < 
(SELECT(AVG(SALARY))FROM Programmer WHERE GENDER = 'F')

--QUERY 80. Who are the Female Programmers earning more than the Highest Paid male?
SELECT PNAME, SALARY FROM Programmer WHERE GENDER='F' AND 
SALARY>(SELECT MAX (SALARY) FROM Programmer WHERE GENDER='M')

--QUERY 81. Which language has been stated as the proficiency by most of the Programmers?
-- same as 78 ??

--QUERY 82. Display the details of those who are drawing the same salary.
SELECT A.PNAME, A.SALARY FROM Programmer A
INNER JOIN PROGRAMMER B ON A.SALARY= B.SALARY AND A.PNAME<>B.PNAME
ORDER BY A.SALARY

--QUERY 83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
SELECT * FROM software WHERE PNAME IN 
(SELECT PNAME FROM programmer WHERE SALARY>3000 AND GENDER='M')

--QUERY 84. Display the details of the packages developed in Pascal by the Female Programmers.
SELECT * FROM Programmer P, Software S 
WHERE P.PNAME=S.PNAME AND GENDER='F' AND DEVELOPIN='PASCAL';

--QUERY 85. Display the details of the Programmers who joined before 1990.
SELECT * FROM Programmer WHERE YEAR(DOJ)<1990;

--QUERY 86. Display the details of the Software Developed in C By female programmers of Pragathi.
SELECT SW.*,P.GENDER,ST.INSTITUTE FROM studies AS ST, software AS SW, programmer AS P
WHERE P.PNAME=SW.PNAME  AND ST.PNAME=SW.PNAME AND
GENDER='F' AND INSTITUTE='PRAGATHI' AND DEVELOPIN='C'

--QUERY 87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
SELECT INSTITUTE, COUNT(SW.TITLE) AS PKGCNT, sum(SW.SOLD) AS SALESCNT, SUM(SCOST*SOLD) AS SALVAL
FROM software AS SW, studies AS ST 
WHERE SW.PNAME=ST.PNAME
GROUP BY INSTITUTE 

--QUERY 88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

INSERT INTO #INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST)


--QUERY 89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))

--QUERY 90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
SELECT SW.*,PG.PROF1,PG.PROF2 from Software AS SW, programmer AS PG 
WHERE PG.PROF1 <> SW.DEVELOPIN AND PG.PROF2 <> SW.DEVELOPIN AND PG.PNAME = SW.PNAME
 
--QUERY 91. Display the details of the software developed by the male students of Sabhari.
SELECT s.*, INSTITUTE FROM Programmer p,Software s,Studies st 
WHERE p.PNAME=s.PNAME and s.PNAME=st.PNAME AND GENDER='M' and INSTITUTE='SABHARI';

--QUERY 92. Display the names of the programmers who have not developed any packages.
SELECT PNAME FROM Programmer 
	WHERE PNAME NOT IN (SELECT PNAME from Software);

--QUERY 93. What is the total cost of the Software developed by the programmers of Apple?
SELECT SUM(SCOST)  FROM Software s,Studies st 
WHERE s.PNAME=st.PNAME and INSTITUTE='APPLE'

--QUERY 94. Who are the programmers who joined on the same day?
SELECT A.PNAME, A.DOJ FROM programmer AS A INNER JOIN programmer AS B
ON A.DOJ=B.DOJ WHERE A.PNAME<>B.PNAME ORDER BY A.DOJ

--QUERY 95. Who are the programmers who have the same Prof2?
SELECT DISTINCT A.PNAME, A.PROF2 FROM programmer AS A INNER JOIN programmer AS B
ON A.PROF2=B.PROF2 WHERE A.PNAME<>B.PNAME ORDER BY A.PROF2

--QUERY 96. Display the total sales value of the software, institute wise.
SELECT s2.INSTITUTE,sum(s1.SOLD*s1.SCOST) from Software s1,Studies s2
	WHERE s1.PNAME=s1.PNAME group by s2.INSTITUTE;

--QUERY 97. In which institute did the person who developed the costliest package study?
SELECT ST.INSTITUTE, SW.PNAME, SW.DCOST FROM studies AS ST, software AS SW 
WHERE ST.PNAME = SW.PNAME AND DCOST= (SELECT MAX(DCOST) FROM software)

--QUERY 98. Which language listed in prof1, prof2 has not been used to develop any package.
SELECT DISTINCT PROF1 FROM programmer WHERE PROF1 NOT IN (SELECT DEVELOPIN FROM software) UNION
SELECT DISTINCT PROF2 FROM programmer WHERE PROF2 NOT IN (SELECT DEVELOPIN FROM software)

--QUERY 99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 

SELECT SW.PNAME,ST.COURSE, PG.SALARY FROM studies AS ST,software AS SW, programmer AS PG
WHERE ST.PNAME = SW.PNAME AND ST.PNAME=PG.PNAME
AND SCOST*SOLD= (SELECT MAX(SCOST*SOLD) FROM software)

--QUERY 100. What is the AVG salary for those whose software sales is more than 50,000/-.
select avg(P.Salary) from Programmer p,Software s 
	where p .PNAME=s.PNAME and SOLD*SCOST >50000;

--QUERY 101. How many packages were developed by students, who studied in institute that charge the lowest course fee?
SELECT PNAME, COUNT(TITLE) FROM software WHERE PNAME IN
(
SELECT PNAME FROM studies WHERE INSTITUTE =
(SELECT DISTINCT INSTITUTE FROM studies WHERE COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM Studies))
)
GROUP BY PNAME

--QUERY 102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
SELECT TG.*, ST.INSTITUTE FROM studies AS ST INNER JOIN 
(
SELECT SW.PNAME, COUNT(TITLE) AS SWCNT 
--INSTITUTE 
FROM software AS SW 
WHERE SW.PNAME = (SELECT PNAME FROM software WHERE DCOST = (SELECT MIN(DCOST) FROM software)) 
GROUP BY SW.PNAME
) AS TG
ON ST.PNAME= TG.PNAME

--QUERY 103. How many packages were developed by the female programmers earning more than the highest paid male programmer?
SELECT COUNT(TITLE) from Programmer p,Software s 
WHERE s.PNAME=p.PNAME and GENDER='F'
AND SALARY>(SELECT MAX(SALARY) FROM programmer WHERE GENDER='M')

--QUERY 104. How many packages are developed by the most experienced programmer form BDPS.
SELECT PNAME, COUNT(TITLE) FROM software WHERE PNAME IN
(
	SELECT PG.PNAME FROM programmer PG 
	WHERE DATEDIFF(YY,DOJ,GETDATE())= (SELECT MAX(DATEDIFF(YY,DOJ,GETDATE())) FROM programmer P, STUDIES T WHERE P.PNAME=T.PNAME AND T.INSTITUTE='BDPS' ) 
)
GROUP BY PNAME

--QUERY 105. List the programmers (form the software table) and the institutes they studied.
SELECT PNAME,INSTITUTE from studies WHERE PNAME IN (SELECT PNAME from software)

--QUERY 106. List each PROFIT with the number of Programmers having that PROF and the number of the packages in that PROF.
SELECT DEVELOPIN,sum(SCOST*SOLD-DCOST) AS PROFIT, COUNT(1) AS PROG_CNT from Software 
WHERE DEVELOPIN IN 
((SELECT PROF1 FROM Programmer) UNION ALL (SELECT PROF2 FROM Programmer))
GROUP BY DEVELOPIN;

--QUERY 107. List the programmer names (from the programmer table) and No. Of Packages each has developed. 
SELECT PG.PNAME,count(TITLE) FROM programmer AS PG,software AS SW 
WHERE PG.PNAME=SW.PNAME GROUP BY PG.PNAME;



