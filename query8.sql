--Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers.
select loans.BorrowerID,loans.BookID,loans.DueDate,DATEDIFF(day, loans.DueDate, SYSDATETIME()) AS DateDiff
from loans 
WHERE DATEDIFF(day, loans.DueDate, SYSDATETIME())>30 ;



