-- AuditLog table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa. The AuditLog should capture BookID, StatusChange, and ChangeDate.
CREATE TABLE auditlog(
BookID INT,
StatusChange NVARCHAR(30),
ChangeDate DATETIME
);


--Trigger Implementation
CREATE TRIGGER t_auditlog
ON dbo.books
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurrentStatus)
    BEGIN
        INSERT INTO auditlog (BookID, StatusChange, ChangeDate)
        SELECT i.BookID, i.CurrentStatus, GETDATE()
        FROM inserted i
        INNER JOIN deleted d ON i.BookID = d.BookID
        WHERE d.CurrentStatus <> i.CurrentStatus;
    END
END;
--THE QUERY TO TRIGGER
UPDATE dbo.books
SET CurrentStatus = 'checked out'
WHERE BookID = 1;
select * from auditlog