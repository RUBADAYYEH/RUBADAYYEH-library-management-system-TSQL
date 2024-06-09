--Active Borrowers with CTEs: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.

WITH [borrowers_with_more_than_2_borrows] (BorrowerID, books_borrows) AS (
    SELECT loans.BorrowerID, COUNT(*) AS books_borrows
    FROM loans
    WHERE loans.DateReturned IS NULL
    GROUP BY loans.BorrowerID
    HAVING COUNT(*) > 2
)
SELECT borrowers.*, bw.books_borrows
FROM borrowers
INNER JOIN [borrowers_with_more_than_2_borrows] bw ON borrowers.BorrowerID = bw.BorrowerID;
