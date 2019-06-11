

create database db_Library
go

use db_library
go

create table Library_Branch(
	BranchID int primary key not null identity (1000,1),
	BranchName varchar(50) not null,
	Address varchar(60) not null
);

create table Publisher(
	PublisherName varchar(100) primary key not null,
	Address varchar(60) not null,
	Phone varchar(25) not null
);

create table Books(
	BookID int primary key not null identity (10000,1),
	Title varchar(150) not null unique,
	PublisherName varchar(100) foreign key references Publisher(PublisherName)
);

create table Borrower(
	CardNo int primary key not null identity(100000,1),
	Name varchar(50) not null,
	Address varchar(60) not null,
	Phone varchar(25)
);


create table Book_Copies(
	BookID varchar(150) foreign key references Books(Title),
	BranchID int foreign key references Library_Branch(BranchID),
	Number_Of_Copies int not null
);

create table Book_Authors(
	BookID int foreign key references Books(BookID),
	AuthorName varchar(60) not null
);

create table Book_Loans(
	BookID varchar(150) foreign key references Books(Title),
	BranchID int foreign key references Library_Branch(BranchID),
	CardNo int foreign key references Borrower(CardNo),
	DateOut varchar(20) not null,
	DateDue varchar(20) not null
);

insert into Library_Branch
(BranchName,Address)
values
('SharpsTown', '1564 SharpsTown rd'),
('Central', '4782 Havels pl'),
('Owensville', '2372 Tonberry ave'),
('HollowCity','6431 FableHaven dr')


;

select*from Library_Branch;

insert into Publisher
(PublisherName,Address,Phone)
values
('Aladdin','1230 Avenue of the Americas', '1-777-456-9584'),
('Freeman','1654 Morgan st','1-531-627-7319'),
('Vintage', '24856 Mission ct','1-408-858-8327'),
('Bantam Books', '6674 george blvd','1-951-2659')
;
select*from Publisher;

insert into Books
(Title,PublisherName)
values
('The Lost Tribe','Aladdin'),
('The Art of Racing in the Rain','Freeman'),
('The Bright Continent','Vintage'),
('Grabbing Back','Bantam Books'),
('A Storm of Swords','Bantam Books'),
('Clarkson','Aladdin'),
('The Ten Books on Architecture','Vintage'),
('A Spirit of Tolerance','Aladdin'),
('Neither Wolf Nor Dog','Freeman'),
('The Shining','Bantam Books'),
('The Long Walk','Bantam Books'),
('The Adventure Zone','Aladdin'),
('Volcanos','Freeman'),
('Pickwick Papers','Vintage'),
('Global Ecopolitics','Bantam Books'),
('Ordinary Egyptians','Vintage'),
('The Art and Science of Java','Aladdin'),
('Landscape and Power in Ancient Mesoamerica','Aladdin'),
('A History of Bombing','Freeman'),
('The Jedi Doth Return','Bantam Books')

;

select*from Books;
select*from Library_Branch;

insert into Book_Authors
(BookID,AuthorName)
values
(10009,'Stephen King'),
(10010,'Stephen King'),
(10000,'Jim Davis'),
(10001,'Jim Davis'),
(10004,'George Martin'),
(10005,'George Martin'),
(10002,'Bill Watterson'),
(10003,'Bill Watterson'),
(10006,'Brandon Mull'),
(10007,'Brandon Mull'),
(10008,'Foucault'),
(10019,'Foucault'),
(10013,'Decker'),
(10014,'Decker'),
(10011,'McElroy'),
(10012,'McElroy'),
(10015,'Koontz'),
(10016,'Koontz'),
(10017,'Amadou Hampate Ba'),
(10018,'Amadou Hampate Ba')
;

insert into Book_Copies
(BookID,BranchID,Number_Of_Copies)
values
('The Lost Tribe',1000,4),
('The Bright Continent',1000,6),
('Grabbing Back',1000,3),
('Clarkson',1000,2),
('The Adventure Zone',1000,5),
('Pickwick Papers',1000,4),
('Global Ecopolitics',1000,6),
('Landscape and Power in Ancient Mesoamerica',1000,3),
('The Jedi Doth Return',1000,2),
('A Spirit of Tolerance',1000,5),
('Grabbing Back',1001,4),
('Clarkson',1001,6),
('The Art of Racing in the Rain',1001,3),
('The Adventure Zone',1001,2),
('The Jedi Doth Return',1001,5),
('Global Ecopolitics',1001,4),
('A Spirit of Tolerance',1001,6),
('Neither Wolf Nor Dog',1001,3),
('The Shining',1001,2),
('The Long Walk',1001,5),
('The Art of Racing in the Rain',1002,4),
('The Bright Continent',1002,6),
('Grabbing Back',1002,3),
('A Storm of Swords',1002,2),
('Clarkson',1002,5),
('A Spirit of Tolerance',1002,4),
('The Shining',1002,6),
('The Adventure Zone',1002,3),
('Volcanos',1002,2),
('Global Ecopolitics',1002,5),
('The Art and Science of Java',1003,4),
('A History of Bombing',1003,6),
('The Bright Continent',1003,3),
('A Storm of Swords',1003,2),
('The Ten Books on Architecture',1003,5),
('The Adventure Zone',1003,4),
('The Long Walk',1003,6),
('The Art of Racing in the Rain',1003,3),
('Grabbing Back',1003,2),
('A Spirit of Tolerance',1003,5)

;
select*from Book_Copies;
/*You Gotta go back and put it all in by name in the table below for the book ID's yes it will be terrible but watch gameplay overview with justin and griffin and it will be a bit better! I believe in you */
insert into Book_Loans
(BookID,BranchID,CardNo,DateOut,DateDue)
values
('The Lost Tribe',1002,100000,'6/1/19','6/14/19'),
('The Bright Continent',1002,100000,'6/1/19','6/14/19'),
('A Storm of Swords',1002,100000,'6/1/19','6/14/19'),
('The Ten Books on Architecture',1002,100000,'6/1/19','6/14/19'),
('A Spirit of Tolerance',1002,100000,'6/1/19','6/14/19'),
('The Adventure Zone',1002,100000,'6/1/19','6/14/19'),
('The Adventure Zone',1001,100001,'6/1/19','6/14/19'),
('Pickwick Papers',1001,100001,'6/1/19','6/14/19'),
('Ordinary Egyptians',1001,100001,'6/1/19','6/14/19'),
('The Long Walk',1001,100001,'6/1/19','6/14/19'),
('Landscape and Power in Ancient Mesoamerica',1001,100001,'6/2/19','6/15/19'),
('The Jedi Doth Return',1001,100001,'6/2/19','6/15/19'),
('A Spirit of Tolerance',1001,100001,'6/2/19','6/15/19'),
('The Adventure Zone',1001,100002,'6/2/19','6/15/19'),
('The Adventure Zone',1003,100003,'6/2/19','6/15/19'),
('The Art of Racing in the Rain',1003,100003,'6/2/19','6/15/19'),
('The Bright Continent',1003,100003,'6/2/19','6/15/19'),
('Clarkson',1003,100003,'6/2/19','6/15/19'),
('A Spirit of Tolerance',1003,100003,'6/2/19','6/15/19'),
('The Shining',1003,100003,'6/2/19','6/15/19'),
('A Storm of Swords',1003,100003,'6/3/19','6/16/19'),
('The Ten Books on Architecture',1003,100003,'6/3/19','6/16/19'),
('A History of Bombing',1003,100003,'6/3/19','6/16/19'),
('Ordinary Egyptians',1000,100003,'6/3/19','6/16/19'),
('The Lost Tribe',1000,100004,'6/3/19','6/16/19'),
('The Art of Racing in the Rain',1000,100004,'6/3/19','6/16/19'),
('The Adventure Zone',1000,100004,'6/3/19','6/16/19'),
('The Long Walk',1000,100004,'6/3/19','6/16/19'),
('The Bright Continent',1000,100004,'6/3/19','6/16/19'),
('Volcanos',1000,100004,'6/3/19','6/16/19'),
('Grabbing Back',1000,100004,'6/4/19','6/17/19'),
('Pickwick Papers',1000,100004,'6/4/19','6/17/19'),
('A Storm of Swords',1000,100004,'6/4/19','6/17/19'),
('Global Ecopolitics',1000,100004,'6/4/19','6/17/19'),
('Clarkson',1000,100004,'6/4/19','6/17/19'),
('Ordinary Egyptians',1000,100004,'6/4/19','6/17/19'),
('The Ten Books on Architecture',1000,100004,'6/4/19','6/17/19'),
('The Art and Science of Java',1001,100005,'6/4/19','6/17/19'),
('A Spirit of Tolerance',1001,100005,'6/4/19','6/17/19'),
('Landscape and Power in Ancient Mesoamerica',1001,100005,'6/4/19','6/17/19'),
('Neither Wolf Nor Dog',1001,100005,'6/5/19','6/18/19'),
('A History of Bombing',1002,100006,'6/5/19','6/18/19'),
('The Shining',1002,100006,'6/5/19','6/18/19'),
('The Jedi Doth Return',1002,100006,'6/5/19','6/18/19'),
('The Lost Tribe',1002,100006,'6/5/19','6/18/19'),
('The Adventure Zone',1002,100006,'6/5/19','6/18/19'),
('Grabbing Back',1002,100006,'6/5/19','6/18/19'),
('Volcanos',1002,100006,'6/5/19','6/18/19'),
('A Spirit of Tolerance',1002,100006,'6/5/19','6/18/19'),
('A Storm of Swords',1002,100006,'6/5/19','6/18/19')

;
select*from Book_Loans;
insert into Borrower
(Name,Address,Phone)
values
('James Butt', '6649 N Blue Gum St','504-621-8927'),
('Josephine Darakjy','4 B Blue Ridge Blvd','810-292-9388'),
('Art Venere','8 W Cerritos Ave #54','856-636-8749'),
('Lenna Paprocki','56 E Morehead St','631-335-3414'),
('Donette Foller','86 Nw 66th St #8673','913-388-2079'),
('Simona Morasca','90991 Thorburn Ave','212-582-4976'),
('Mitsue Tollner','4545 Courthouse Rd','516-968-6051')

;
select*from Borrower;

