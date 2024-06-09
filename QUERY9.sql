--Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books.
select  books.Author , Count(loans.LoanID)  as frequency,dense_RANK() OVER (ORDER BY Count(loans.LoanID) DESC ) as popularityRank
FROM loans INNER JOIN books ON loans.BookID=books.BookID
GROUP BY books.Author




