/**** Author database ****/
USE db_author
GO

CREATE TABLE tbl_authors (
	author_id INT PRIMARY KEY NOT NULL IDENTITY,
	author_fname VARCHAR(50) NOT NULL,
	author_lname VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY(200,1),
	book_name	VARCHAR(50) NOT NULL,
	book_year INT NOT NULL,
	book_author INT NOT NULL CONSTRAINT fk_authors_id FOREIGN KEY REFERENCES tbl_authors(author_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_authors
	(author_fname, author_lname)
	VALUES
	('John Ronald Reuel','Tolkien'),
	('Clive Staples','Lewis'),
	('Joanne','Rowling'),
	('Toon','Kortooms'),
	('Jan ','Terlouw')
;

INSERT INTO tbl_books
	(book_name, book_year, book_author)
	VALUES
	('The Magician''s Nephew ', '1955', 2),
	('Philosopher''s Stone ','1997', 3),
	('The Hobbit: or There and Back Again','1937',1),
	('Koning van Katoren','1971', 5),
	('The Screwtape Letters','1942', 2),
	('Deze jongeman','1952', 4),
	('The Fellowship of the Ring','1954', 1),
	('Prisoner of Azkaban','1999', 3),
	('Help! De dokter verzuipt...','1968', 4)
	;



	SELECT * FROM tbl_books a1
	INNER JOIN tbl_authors a2 ON a2.author_id = a1.book_author
	WHERE Author_id = 1;