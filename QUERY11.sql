-- List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned
CREATE FUNCTION GetBooksForBorrowerWithID(@borrowerID INT)
RETURNS TABLE
AS
RETURN 
    SELECT books.*
    FROM books
    INNER JOIN loans ON books.BookID = loans.BookID
    WHERE loans.BorrowerID = @borrowerID;
	--TO USE THE FUNCTION IN DIFFERENT BATCH
SELECT * FROM GetBooksForBorrowerWithID(1)


