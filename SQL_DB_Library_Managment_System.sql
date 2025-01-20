/**** LIBRARY MANAGMENT SYSTEM ****/

/****INFORMATION IN THIS DATABASE IS NOT ACURATE ITS ONLY FOR EXSECISE!!!!****/

--Comment the next statement out and run it to create the database.
--create database db_library;

--Makes sure you use the library database.
use db_library


/**** CREATE TABLES ****/

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Name VARCHAR(50) NOT NULL,
	Adress VARCHAR(50) NOT NULL,
	Phone VARCHAR (20) NOT NULL
);


CREATE TABLE book_loans (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	NumberOfCopies INT NOT NULL
);

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(2000,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

CREATE TABLE book_authors (
	BookID INT NOT NULL,
	AuthorName VARCHAR(50)
);

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Addres VARCHAR(50) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);

/**** CREATE FOREIGN KEYS ****/

--Foreign Keys in book_loans Table
ALTER TABLE book_loans
	ADD CONSTRAINT fk_book_id FOREIGN KEY (BookID) REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE book_loans
	ADD CONSTRAINT fk_branch_id FOREIGN KEY (BranchID) REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE book_loans
	ADD CONSTRAINT fk_card_no FOREIGN KEY (CardNo) REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE;

--Foreign Keys in book_copie Table
ALTER TABLE book_copies
	ADD CONSTRAINT fk_book_id_1 FOREIGN KEY (BookID) REFERENCES Books(BookID);


ALTER TABLE book_copies
	ADD CONSTRAINT fk_branch_id_1 FOREIGN KEY (BranchID) REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE;

--Foreign Keys in books Table
ALTER TABLE books
	ADD CONSTRAINT fk_publisher_name FOREIGN KEY (PublisherName) REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE;

--Foreign Keys in book_authors Table
ALTER TABLE book_authors
	ADD CONSTRAINT fk_book_id_2 FOREIGN KEY (BookID) REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE;


/**** POPULATE TABLES ****/

INSERT INTO library_branch VALUES
	('Sharpstown','Rosestreet 15'),
	('Book City','Lilylane 221'),
	('Readvillage','Dahlia avenue 345'),
	('Word Town','Iris alley 45'),
	('UpperCase City','Daisystreet 6'),
	('LowerCase Town','Azaleastreet 83');
SELECT * FROM library_branch;

INSERT INTO borrower VALUES
	('David', 'Southstreet 501, Word Town', '0518-346-975'),
	('Nadine', 'Salt Lane 54, UpperCase City', '0534-885-964'),
	('Frank', 'Hill Ally 5, Readvillage', '05-555-995'),
	('Maria', 'Seestreet 43, Book City', '05-989-631'),
	('James', 'Money Road, Book City', '023-546-731'),
	('Bob', 'School Street, LowerCase Town', '0247-713-268'),
	('Martha', 'Evening Road 3', '0291-663-441'),
	('Evi', 'Rosestreet 28, Sharpstown', '0278-422-351');
SELECT * FROM borrower;

INSERT INTO  publisher VALUES
	('Abramsbooks', '195 Broadway, New York, NY 10007', '0555-555-555'),
	('Blackstaff Press', '21 Jubilee Road, Newtownards Down BT23 4YH', '0666-666-666'),
	('Chronicle Books', '680 Second Street, San Francisco, California 94107','0777-777-777'),
	('Hesperus Press', '28 Mortimer Street, London W1W 7RD','0888-888-888'),
	('Informa', '5 Howick Place, London SW1P 1WG UK','0999-999-999'),
	('Random House', '1745 Broadway, New York City, New York, U.S.','0444-444-444'),
	('Methuen Publishing', 'Trent Road, Grantham NG31 7XQ ','0333-333-333'),
	('Open Book Publishers', '40 Devonshire Road, Cambridge United Kingdom','0222-222-222'),
	('David & Charles', 'Tourism House, Pynes Hill, Exeter EX2 5WS','0111-111-111'),
	('Fantagraphics', '7563 Lake City Way NE Seattle, WA 98115','0101-010-101');
SELECT * FROM publisher;

INSERT INTO books VALUES
	('The Hobbit','Abramsbooks'),
	('The Hunger Games','Chronicle Books'),
	('Koning van Katore','Random House'),
	('Catching Fire','Blackstaff Press'),
	('Adventures of Huckleberry Finn','Methuen Publishing'),
	('Dune','Hesperus Press'),
	('The Thorn Birds','David & Charles'),
	('The Boy in the Striped Pyjamas','Chronicle Books'),
	('Goodnight Moon','Open Book Publishers'),
	('The Lovely Bones','Abramsbooks'),
	('Charlie and the Chocolate Factory','Open Book Publishers'),
	('Matilda','Informa'),
	('Deze Jonge Man','Random House'),
	('The Giver','Hesperus Press'),
	('Harry Potter and the Philosopher''s Stone','Fantagraphics'),
	('The Screwtape Letters','Methuen Publishing'),
	('The Poky Little Puppy','Chronicle Books'),
	('The Book Thief','David & Charles'),
	('Left Behind','Blackstaff Press'),
	('The Goal','Open Book Publishers');
SELECT * FROM books; 

INSERT INTO book_authors VALUES
	(2000,'James'),
	(2001,'Adam'),
	(2002,'Emmie'),
	(2003,'Ester'),
	(2004,'James'),
	(2005,'David'),
	(2006,'Nathan'),
	(2007,'Vera'),
	(2008,'Elsa'),
	(2009,'Ron'),
	(2010,'Renske'),
	(2011,'James'),
	(2012,'Martin'),
	(2013,'Nathan'),
	(2014,'Adam'),
	(2015,'Ester'),
	(2016,'Emmie'),
	(2017,'Adam'),
	(2018,'Martin'),
	(2019,'Adam');
SELECT * FROM book_authors;

INSERT INTO book_copies VALUES
	(2000,1,4),(2000,3,5),(2000,5,2),
	(2001,3,10),
	(2002,2,6),(2002,1,3),
	(2003,4,4),
	(2004,6,2),(2004,5,2),(2004,2,2),(2004,1,2),
	(2005,1,3),
	(2006,2,7),
	(2007,3,4),
	(2008,4,3),(2008,5,2),(2008,6,2),
	(2009,5,2),
	(2010,6,5),
	(2011,1,4),
	(2012,2,8),(2012,3,2),
	(2013,4,3),
	(2014,5,2),(2014,6,2),
	(2015,4,2),(2015,5,2),
	(2016,3,3),(2016,2,4),
	(2017,1,6),
	(2018,2,3),(2018,3,3),
	(2019,6,8);
SELECT * FROM book_copies;

INSERT INTO book_loans VALUES
	(2012,2,1004,'2024-06-23','2024-07-23'),
	(2004,1,1004,'2024-06-23','2024-07-23'),
	(2016,3,1007,'2024-06-12','2024-07-12'),
	(2011,1,1007,'2024-06-13','2024-07-13'),
	(2009,5,1007,'2024-06-04','2024-07-04'),
	(2007,3,1003,'2024-06-01','2024-07-01'),
	(2019,6,1003,'2024-06-01','2024-07-01'),
	(2001,3,1006,'2024-05-20','2024-06-20'),
	(2013,4,1001,'2024-05-14','2024-06-14'),
	(2011,1,1002,'2024-05-09','2024-06-09');
SELECT * FROM book_loans

Update book_loans
set 

/**** Queries ****/

--Select Full Joins Tables book_loans, borrower and books.
SELECT * FROM 
((book_loans FULL OUTER JOIN borrower ON book_loans.CardNo =borrower.CardNo)
FULL OUTER JOIN books ON book_loans.BookID = books.BookID);

-- Returns all book titles and author names.
SELECT a1.AuthorName, a2.Title 
FROM book_authors a1
FULL OUTER JOIN	books a2 ON a1.BookID = a2.BookID;


-- Returns all borrower Names and CardNo's from borrowers that fave no book checked out.
SELECT a1.Name, a1.CardNo
FROM borrower a1
FULL OUTER JOIN book_loans a2 ON a1.CardNo = a2.CardNo
WHERE not exists (select * from book_loans a2 where a1.CardNo = a2.CardNo);

--Returns how many copies of Dune the library branch Sharpstown has.
EXEC [dbo].[uspGetNumberOfCopysByBranchName_Title]

--Returns how many coppies of Adventures of Huckleberry Finn each branch has.

EXEC [dbo].[uspGetHowManyCopiesEachBranch]