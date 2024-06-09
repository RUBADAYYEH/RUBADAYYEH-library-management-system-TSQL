--Genre Preference by Age using Group By and Having
SELECT 
    books.Genre,
    COUNT(loans.LoanID) as frequency,
    DATEDIFF(year, borrowers.DateOfBirth, SYSDATETIME()) AS Age 
FROM 
    loans
INNER JOIN 
    books ON books.BookID = loans.BookID
INNER JOIN 
    borrowers ON borrowers.BorrowerID = loans.BorrowerID
GROUP BY  DATEDIFF(year, borrowers.DateOfBirth, SYSDATETIME()),books.Genre
HAVING 
    COUNT(loans.LoanID) > 0 
ORDER BY 
    DATEDIFF(year, borrowers.DateOfBirth, SYSDATETIME()), frequency DESC;

	select *  from borrowers;




