DROP PROCEDURE IF EXISTS p_add_borrower;
GO
CREATE PROCEDURE p_add_borrower (@id INT , @firstname nvarchar(MAX) ,@lastname nvarchar(MAX)  , @email nvarchar(MAX)  , @dateofbirth datetime  )

AS BEGIN
  INSERT INTO borrowers (BorrowerID,Firstname,Lastname,Email,DateofBirth,MembershipDate)VALUES(@id,@firstname,@lastname,@email,@dateofbirth,SYSDATETIME())
END;
