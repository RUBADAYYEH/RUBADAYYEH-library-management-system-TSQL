--Database Function - Book Borrowing Frequency:
CREATE FUNCTION fn_BookBorrowingFrequency(@BookID INT)
RETURNS TABLE 
AS RETURN 
select loans.BookID,count(loans.LoanID) AS BorrowingFrequency from loans WHERE loans.BookID=@BookID  group by loans.BookID 
go
select * from dbo.fn_BookBorrowingFrequency(1);


