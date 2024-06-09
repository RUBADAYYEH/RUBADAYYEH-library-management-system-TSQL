--Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency.

WITH [borrows_frequency] (BorrowerID,frequency)
AS(
select borrowers.BorrowerID ,Count(*) as frequency from borrowers
INNER JOIN loans ON loans.BorrowerID = borrowers.BorrowerID group by borrowers.BorrowerID)

SELECT borrowers.*, [borrows_frequency].frequency , Rank() OVER (order by [borrows_frequency].frequency desc) as rank from borrowers 
INNER JOIN [borrows_frequency] ON [borrows_frequency].BorrowerID=borrowers.BorrowerID;
