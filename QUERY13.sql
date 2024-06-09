--Design a stored procedure that retrieves all borrowers who have overdue books. 
DROP PROCEDURE pr_overdueBorrowers;
CREATE PROCEDURE pr_overdueBorrowers 
AS BEGIN
SELECT borrowers.BorrowerID,borrowers.Email,loans.DueDate,DATEDIFF(day,loans.DueDate,SYSDATETIME()) AS OverDueDays
FROM borrowers INNER JOIN loans ON borrowers.BorrowerID=loans.BorrowerID WHERE 
DATEDIFF(day,loans.DueDate,SYSDATETIME())>0 AND loans.DateReturned IS NULL ;
END;

--Store these borrowers in a temporary table,
DROP TABLE tempTable;
CREATE TABLE tempTable(
BorrowerID INT,
Email NVARCHAR(MAX),
DueDate DATETIME,
OverDueDays INT
);
INSERT INTO  tempTable 
EXEC pr_overdueBorrowers ;



