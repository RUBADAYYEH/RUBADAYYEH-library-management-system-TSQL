--Stored Procedure - Add New Borrowers

DROP PROCEDURE IF EXISTS sp_AddNewBorrower;
GO
CREATE PROCEDURE sp_AddNewBorrower (@id INT OUTPUT , @firstname nvarchar(MAX) ,@lastname nvarchar(MAX)  , @email nvarchar(MAX)  , @dateofbirth datetime  )

AS BEGIN
if EXISTS (SELECT * FROM borrowers WHERE Email=@email)
BEGIN
RAISERROR('EMAIL IS TAKEN INSETION IS FAILED',16,1);
RETURN
END
INSERT INTO borrowers (BorrowerID ,Firstname,Lastname,Email,DateofBirth,MembershipDate)VALUES(@id,@firstname,@lastname,@email,@dateofbirth,SYSDATETIME())
 PRINT (@id);
END

--TO EXECUTE THE PROCEDURE
EXEC sp_AddNewBorrower 1007, "ruby", "ayyeh", "ruaf.tay@maigl.com","2003-03-29";

