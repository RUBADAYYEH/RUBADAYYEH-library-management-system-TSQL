--Database Function - Calculate Overdue Fees
--DROP FUNCTION dbo.fn_CalculateOverdueFees;
CREATE FUNCTION fn_CalculateOverdueFees(@LoanId INT)
RETURNS INT 
AS 
BEGIN
    DECLARE @DueDate DATE;
    DECLARE @OverdueDays INT;
	DECLARE @OverdueDaysaftermonth INT;

    SELECT @DueDate = DueDate 
    FROM loans 
    WHERE LoanID = @LoanId;

    SET @OverdueDays = DATEDIFF(day, @DueDate, SYSDATETIME());

    IF @OverdueDays < 0
    BEGIN
        SET @OverdueDays = 0;
    END
	IF @OverdueDays > 30
    BEGIN
	print(@OverdueDays);
	    SET @OverdueDaysaftermonth=(@OverdueDays-30)*2;
        SET @OverdueDays = 30 + @OverdueDaysaftermonth;
    END

    RETURN @OverdueDays;
END;
GO
SELECT loans.*, dbo.fn_CalculateOverdueFees(2) AS OverdueFees
FROM loans
WHERE loans.LoanID = 3;
