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