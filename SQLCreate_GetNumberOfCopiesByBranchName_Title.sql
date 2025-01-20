--USE db_library

CREATE PROC dbo.uspGetNumberOfCopysByBranchName_Title
AS

SELECT a1.BranchName, a2.Title, a3.NumberOfCopies 
From
((library_branch a1 FULL OUTER JOIN book_copies a3 ON a1.BranchID = a3.BranchID)
FULL OUTER JOIN books a2 ON a3.BookID = a2.BookID)
WHERE a1.BranchName = 'Sharpstown' AND a2.Title = 'Dune';