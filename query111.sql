--Stored Procedure - Borrowed Books Report:
DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport;
GO
CREATE PROCEDURE sp_BorrowedBooksReport(@BeginDATE DATETIME ,@EndDate DATETIME)
AS BEGIN
  SELECT books.BookID,books.Title,loans.BorrowerID,borrowers.Firstname,borrowers.Lastname,loans.DateBorrowed
  FROM loans
  INNER JOIN books ON books.BookID=loans.BookID 
  INNER JOIN borrowers ON loans.BorrowerID=borrowers.BorrowerID
  WHERE loans.DateBorrowed BETWEEN @BeginDATE AND @EndDate;
END; 
-- to execute the procedure
EXEC sp_BorrowedBooksReport "2023-09-01 00:00:00.000","2023-09-09 00:00:00.000";





