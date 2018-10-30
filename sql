SELECT data_1.payee_id, (data_1.P + data_1.F) as volume_figure

FROM
    (SELECT payee_id, SUM(principal) as P, SUM(fee) as F
    FROM
    (SELECT *
    FROM payments
    WHERE success = 1
    AND submitted_at like "2018%") as data_0
    GROUP BY payee_id) as data_1

WHERE (data_1.P + data_1.F > 100000)

######
SELECT 
x.id, x.name, x.vertical, type, x.flag
FROM 
    (SELECT
    payees.name, payees.vertical, payments.id, payments.principal, 
    payments.fee, payments.submitted_at, payments.success, 
    (principal+fee) as total,
    
    (CASE WHEN (principal+fee)>10000.00
                THEN 1 ELSE 0 END) AS flag
    
    FROM payments
    
    JOIN payees on (payments.payee_id=payees.id)
    
    WHERE submitted_at >= ( CURDATE() - INTERVAL 90 DAY )
    AND success = 0) as x

JOIN cards ON x.id = cards.id
####
SELECT
payees.name, payees.vertical, payments.id, payments.principal, 
payments.fee, payments.submitted_at, payments.success, 
(principal+fee) as total,

(CASE WHEN (principal+fee)>10000.00
            THEN 1 ELSE 0 END) AS flag

FROM payments

JOIN payees on (payments.payee_id=payees.id)

WHERE submitted_at >= ( CURDATE() - INTERVAL 90 DAY )
AND success = 0



####
    (SELECT Name
          (CASE WHEN Occupation='Doctor'
            THEN Name ELSE NULL END) AS Doctor
      FROM Occupations) 


# https://leetcode.com/problems/department-highest-salary/description/



SELECT final.Salary, Final.Employee, Department.Name as Department
FROM 
    (SELECT mx.DepartmentID , Employee.Name as Employee, Employee.Salary as Salary
    FROM 
    (    (Select Max(Salary) as Salary, DepartmentID
            FROM Employee
        GROUP BY DepartmentID)) as mx
    LEFT JOIN Employee 
          on Employee.DepartmentID = mx.DepartmentID
    WHERE mx.Salary = Employee.Salary) as final
JOIN 
    Department 
    ON 
    final.DepartmentID = Department.Id



/* 
https://www.hackerrank.com/challenges/the-pads/problem

Generate the following two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:  

*/

           SELECT concat(Name, '(',SUBSTRING(Occupation, 1,1), ')')
           From Occupations ; 


           SELECT  'There are a total of',count(Occupation), concat(LOWER(Occupation),"s.")
           FROM OCCUPATIONS
           Group by occupation
           ORDER BY count(Occupation), Occupation





SELECT 
x.id, x.name, x.vertical, type, x.flag
FROM 
    (SELECT
    payees.name, payees.vertical, payments.id, payments.principal, 
    payments.fee, payments.submitted_at, payments.success, 
    (principal+fee) as total,
    
    (CASE WHEN (principal+fee)>10000.00
                THEN 1 ELSE 0 END) AS flag
    
    FROM payments
    
    JOIN payees on (payments.payee_id=payees.id)
    
    WHERE submitted_at >= ( CURDATE() - INTERVAL 90 DAY )
    AND success = 0) as x

JOIN cards ON x.id = cards.id

A list of payees and the number of successful payments they have had. Please have the query output the payee id, the name of the payee, and the number of successful payments (if the payee has no successful payments, please have the payee included in the row, but the number or successful payments listed as 0). 

	SELECT x.successful_payments, name, x.payee_id

FROM
    (select payee_id, sum(success) as successful_payments
    from payments
    GROUP BY payee_id) as x
    
JOIN payees on (payees.id = x.payee_id)
#######



/*
Enter your query here.
company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees.
 employee_code, manager_code, senior_manager_code, lead_manager_code, company_code, founder,
 
 count(lead_manager_code), count(senior_manager_code), count(manager_code), count(employee_code)

 count(lead_manager_code), count(senior_manager_code), count(manager_code), count(employee_code)
*/
              Select  temp.company_code, temp.founder, COUNT(DISTINCT(lead_manager_code)), COUNT(DISTINCT((senior_manager_code))), COUNT(DISTINCT(manager_code)), COUNT(DISTINCT(employee_code))
              From

                  (Select Employee.employee_code, Employee.manager_code, Employee.senior_manager_code, lead_manager_code, Employee.company_code, Company.founder
                  from Employee 
                  left join Company 
                   on Employee.company_code = Company.company_code) AS temp

              GROUP BY temp.company_code, temp.founder


##


##https://www.hackerrank.com/challenges/the-report/problem

               Select e.Name, ROUND(ceil(t.Marks/10)) as Grade, t.Marks
              from Students t
              LEFT join 
              (        Select e.ID, e.Name, e.Marks
                  From Students e
                      WHERE Marks > 79) e
              ON e.ID = t.ID                                    
              ORDER BY Grade DESC, Name 
