CREATE DATABASE Library;
USE Library;


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthYear INT
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublishedYear INT,
    CopiesAvailable INT,
    BookCategory VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Authors(AuthorID,FirstName,LastName,BirthYear)VALUES(1,'SAJA','SALEH',2001);
INSERT INTO Authors(AuthorID,FirstName,LastName,BirthYear)VALUES(2,'SANAD','SALEH',2002);
INSERT INTO Authors(AuthorID,FirstName,LastName,BirthYear)VALUES(3,'MOHAMMAD','SALEH',1999);
INSERT INTO Authors(AuthorID,FirstName,LastName,BirthYear)VALUES(4,'MONA','MAHMMOD',1998);
INSERT INTO Authors(AuthorID,FirstName,LastName,BirthYear)VALUES(5,'SAJA','SALEH',2001);


INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES (1,'AMAL',1,1999,5,'CLASSA');
INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES (2, 'The Great Gatsby', 2, 1925, 2, 'Classic');
INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES (3, 'Harry Potter and the Philosopher', 3, 1997, 10, 'Fantasy');
INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES(4, 'The Adventures of Tom Sawyer', 4, 1876, 3, 'Fiction');
INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES(5, 'Pride and Prejudice', 4, 1813, 4, 'Romance');


SELECT * FROM Books, Authors WHERE Books.AuthorID = Authors.AuthorID;
SELECT MAX(CopiesAvailable), MIN(CopiesAvailable) FROM Books;
SELECT AVG(PublishedYear) FROM Books;
SELECT SUM(CopiesAvailable) FROM Books;
TRUNCATE TABLE Books;
ALTER TABLE Authors ADD Email VARCHAR(30), Phone_Number INT;
DROP TABLE Authors;






