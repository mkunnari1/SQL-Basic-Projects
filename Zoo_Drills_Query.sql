use db_zoo
go


/*drill 1 */
select * from tbl_habitat;

/*drill 2*/
select 

	a1.species_name 

from tbl_species a1

where species_order = 3
;

/*drill 3 */

select 
	a1.nutrition_type
from tbl_nutrition a1
where nutrition_cost < 600
;

/* drill 4 */

select 
	a1.species_name
from tbl_species a1
where species_nutrition between 2202 and 2206
;

/* drill 5 */
select 
	a1.species_name as 'Species Name',
	a2.nutrition_type as 'Nutrition Type'
from tbl_species a1
	inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
;
/* drill 6 */

select 
	specialist_fname,
	specialist_lname,
	specialist_contact
from tbl_specialist
	inner join tbl_care on tbl_care.care_specialist=tbl_specialist.specialist_id
	inner join tbl_species on tbl_species.species_care=tbl_care.care_id

where species_name = 'penguin'
;

/* drill 7 */

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