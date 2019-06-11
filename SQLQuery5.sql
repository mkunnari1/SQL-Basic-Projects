use db_zooTest2
go

create table tbl_name (
	name_id int primary key not null identity (1,1),
	name_fname varchar(50) not null,
	name_lname varchar(50) not null
);
insert into tbl_name (name_fname, name_lname)
	values
	('John','Snow'),
	('Dan','Dannington'),
	('Tim','The Tool Man Taylor'),
	('Doug','Funny')
;

create table tbl_contact (
	contact_id int not null constraint fk_name_id foreign key references tbl_name(name_id) on update cascade on delete cascade,
	contact_phone varchar(15) not null,
	contact_address varchar(50) not null
	
	
);

insert into tbl_contact(contact_id,contact_phone,contact_address)
	values
	(1,'123-4567','1 The Wall AVE.'),
	(2,'475-6584','Danningtonshire Cottage'),
	(3,'1-800-the-tool','The Home Depot'),
	(4,'456-7890','Bangin on a Trash Can')
;

select * from tbl_name;
select * from tbl_contact;


select name_fname, contact_phone,contact_address
from tbl_name
full outer join tbl_contact
on tbl_name.name_id=tbl_contact.contact_id
where name_fname= 'John'
;



drop table tbl_contact;
drop table tbl_name;