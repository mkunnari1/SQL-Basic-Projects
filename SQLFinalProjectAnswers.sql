use db_Library
go


/*answer 1 */
create procedure answer_1
as

	select 
		Number_Of_Copies
	from 
		Book_Copies
	inner join 
		library_branch
	on 
		book_copies.BranchID = library_branch.branchID
	inner join
		books
	on
		book_copies.bookid = books.title
	where
		library_branch.Branchname = 'Sharpstown' and books.title = 'The Lost Tribe'
go

exec answer_1;

/* end answer 1 */

/*Answer 2*/
create procedure Answer_2
as

select 
	book_copies.Number_Of_Copies,
	library_branch.BranchName,
	book_copies.BookID

from
	book_copies
	full outer join Library_Branch
	on book_copies.BranchID = Library_Branch.BranchID

where book_copies.BookID = 'The Lost Tribe'

go

exec Answer_2;

/* End Answer_2 */

/* Answer_3 */

create procedure Answer_3
as

select 
	Borrower.Name

from
	borrower

	where Borrower.CardNo not in (select CardNo from Book_Loans )

go

exec Answer_3;

/* end Answer_3 */

/* Answer_4 */

create proc Answer_4
as

select 
	Book_Loans.BookID,
	Borrower.Name,
	Borrower.Address

	from 
		borrower
		inner join Book_Loans
		on Borrower.CardNo = Book_Loans.CardNo

where 
	Book_Loans.DateDue = GETDATE()

go

exec Answer_4;

/* end Answer_4 */


/* Answer_5 */

create proc Answer_5
as

select distinct
	Library_Branch.BranchName,
	(select count(bookID) from Book_loans where book_loans.branchID=Library_Branch.BranchID)
	
	from Library_Branch
	full outer join book_loans
	on library_branch.branchID = book_loans.branchID

go

exec Answer_5;

/* end Answer_5 */

/* Answer_6 */
create proc Answer_6
as

select distinct
	Borrower.Name,
	Borrower.Address,
	(select count (bookID) from Book_Loans where borrower.CardNo=Book_Loans.CardNo) as 'books checked out'

	from Borrower
	full outer join Book_Loans
	on Borrower.CardNo = Book_Loans.CardNo

	where (select count (bookID) from Book_Loans where borrower.CardNo=Book_Loans.CardNo) >= 5

go

exec Answer_6;

/* end Answer_6 */

/* Answer_7 */

create proc Answer_7
as

select distinct 
	books.title,
	Book_Copies.Number_Of_Copies

from
	books
	inner join Book_Copies
	on books.Title = Book_Copies.BookID

	inner join Book_Authors
	on Books.BookID = Book_Authors.BookID

	inner join Library_Branch
	on book_copies.BranchID = Library_Branch.BranchID

where
	Book_Authors.AuthorName = 'Stephen King' and Library_Branch.BranchName = 'Central'

go

exec Answer_7;

