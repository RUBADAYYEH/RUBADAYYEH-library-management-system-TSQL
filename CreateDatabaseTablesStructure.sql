DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;
USE Library;
DROP TABLE IF EXISTS books;
create table books (
BookID int NOT NULL,
Title nvarchar(MAX) ,
Author nvarchar(MAX) NOT NULL,
ISBN nvarchar(MAX) NOT NULL,
PublishedDate datetime NOT NULL,
Genre nvarchar(MAX) NOT NULL,
ShelfLocation nvarchar(MAX) NOT NULL,
CurrentStatus nvarchar(MAX) NOT NULL,
CONSTRAINT  books_pk PRIMARY KEY (BookID)
);
DROP TABLE IF EXISTS borrowers;
create table borrowers (
BorrowerID int NOT NULL ,
Firstname nvarchar(MAX) NOT NULL,
Lastname nvarchar(MAX) NOT NULL,
Email nvarchar(MAX) NOT NULL,
DateofBirth datetime NOT NULL,
MembershipDate datetime ,
CONSTRAINT  borrowers_pk PRIMARY KEY (BorrowerID)
);
DROP TABLE IF EXISTS loans;
create table loans (
LoanID int NOT NULL,
BookID int NOT NULL,
BorrowerID int NOT NULL,
DateBorrowed datetime NOT NULL,
DueDate datetime NOT NULL,
DateReturned datetime NULL,
CONSTRAINT  loans_pk PRIMARY KEY (LoanID),
CONSTRAINT book_fk FOREIGN KEY (BookId) REFERENCES books(BookId),
CONSTRAINT borrower_fk FOREIGN KEY (BorrowerID) REFERENCES borrowers(BorrowerID)
);

