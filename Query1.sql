

create procedure createZooDB
as

begin

	create table tbl_animalia (
		animalia_id int primary key not null identity (1,1),
		animalia_type varchar(50) not null
	);

	insert into tbl_animalia
		(animalia_type)
		values
			('vertebrate'),
			('invertebrate')
	;


	select * from tbl_animalia;

	create table tbl_class(
		class_id int primary key not null identity (100,1),
		class_type varchar(50) not null
	);



	insert into tbl_class
		(class_type)
		values
			('avian'),
			('reptilian'),
			('mammal'),
			('arthropod'),
			('fish'),
			('worm'),
			('cnidaria'),
			('echinoderm')
	;
	select * from tbl_class;

	update tbl_class set class_type = 'birds' where class_type = 'avian'

	select REPLACE(class_type, 'birds','butts') from tbl_class;

	select upper(class_type) from tbl_class where class_type = 'birds';

	select count(class_type) from tbl_class where class_type = 'worm';


	create table tbl_persons (
		persons_id int primary key not null identity (1,1),
		persons_fname varchar(50) not null,
		persons_lname varchar(50) not null,
		persons_contact varchar(50) not null,

	);


	insert into tbl_persons
		(persons_fname, persons_lname, persons_contact)
		values
			('ben','boobly','650-666-6969'),
			('bob','rob','234-420-4747'),
			('john','snow','1800-the-wall'),
			('simon','lizotte','1-888-crushedd'),
			('eagle','mcmahon','1-888-crushedd')
		
	;

	update tbl_persons set persons_fname = 'jars' where persons_fname = 'mars';

	select * from tbl_persons;

	select persons_fname, persons_lname, persons_contact from tbl_persons where persons_lname like '_c%n';

	select persons_fname, persons_lname, persons_contact from tbl_persons where persons_fname like 'j%' order by persons_lname desc;

	select persons_fname as 'firstname', persons_lname as 'lastname', persons_contact as 'phone:' from tbl_persons where persons_fname like 'j%' order by persons_lname;

	delete from tbl_persons where persons_lname = 'rob';

	select * from tbl_persons;

	drop table tbl_persons;


	select * from tbl_class;

	create table tbl_order(
		order_id int primary key not null identity (1,1),
		order_type varchar(50) not null
	);

	create table tbl_care(
		care_id varchar(50) primary key not null,
		care_type varchar(50) not null,
		care_specialist int not null
	);

	create table tbl_nutrition (
		nutrition_id int primary key not null identity (2200,1),
		nutrition_type varchar(50) not null,
		nutrition_cost money not null
	);

	create table tbl_habitat (
		habitat_id int primary key not null identity(5000,1),
		habitat_type varchar(50),
		habitat_cost money not null
	);

	create table tbl_specialist (
		specialist_id int primary key not null identity (1,1),
		specialist_fname varchar(50) not null,
		specialist_lname varchar(50) not null,
		specialist_contact varchar(50) not null
	);

	insert into tbl_order
		(order_type)
		values
		('carnivore'),
		('herbivore'),
		('omnivore')
	;

	select * from tbl_order;

	insert into tbl_care
		(care_id, care_type, care_specialist)
		values
		('care_0', 'replace the straw',1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins',1),
		('care_3', 'human contact_pet subject', 2),
		('care_4', 'clean up animal waste', 1),
		('care_5', 'move subject to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'extensive dental work', 3)
	;

	select * from tbl_care;

	insert into tbl_nutrition
		(nutrition_type, nutrition_cost)
		values
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice', 800),
		('warm bottle of milk', 600),
		('syringe feed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;

	select * from tbl_nutrition;


	insert into tbl_habitat
		(habitat_type, habitat_cost)
		values
		('tundra', 40000),
		('grassy knoll with trees', 12000),
		('10 ft pond with rocks', 30000),
		('icy aquarium with snowy facade', 50000),
		('short grass with shade and moat', 50000),
		('netted forest atrium',10000),
		('jungle vines with winding branches',15000),
		('cliff with shaded cave', 15000)
	;

	select * from tbl_habitat;

	insert into tbl_specialist
		(specialist_fname,specialist_lname,specialist_contact)
		values
		('margret','nyguen','384-576-2899'),
		('mary','fischer','384-784-4856'),
		('arnold','holden','385-475-3944'),
		('kem','bysan','384-485-4855'),
		('delmonte','fyedo','768-288-3749')
	;
	select*from tbl_specialist;

	create table tbl_species (
		species_id int primary key not null identity(1,1),
		species_name varchar(50) not null,
		species_animalia int not null constraint fk_animalia_id foreign key references tbl_animalia(animalia_id) on update cascade on delete cascade,
		species_class int not null constraint fk_class_id foreign key references tbl_class(class_id) on update cascade on delete cascade,
		species_order int not null constraint fk_order_id foreign key references tbl_order(order_id) on update cascade on delete cascade,
		species_habitat int not null constraint fk_habitat_id foreign key references tbl_habitat(habitat_id) on update cascade on delete cascade,
		species_nutrition int not null constraint fk_nutrition_id foreign key references tbl_nutrition(nutrition_id) on update cascade on delete cascade,
		species_care varchar(50) not null constraint fk_care_id foreign key references tbl_care(care_id) on update cascade on delete cascade
	);

	select* from tbl_species;

	insert into tbl_species
		(species_name,species_animalia,species_class,species_order,species_habitat,species_nutrition,species_care)
		values
		('brown bear',1,102,3,5007,2200,'care_1'),
		('jaguar',1,102,1,5007,2200,'care_4'),
		('penguin',1,100,1,5003,2200,'care_6'),
		('ghost bat',1,102,1,5007,2204,'care_2'),
		('chicken',1,100,3,5006,2202,'care_0'),
		('panda',1,102,1,5001,2204,'care_4'),
		('bobcat',1,102,1,5001,2204,'care_5'),
		('grey wolf',1,102,1,5000,2201,'care_4')
	;

	select*from tbl_species;

	select 
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		from tbl_species a1
		inner join tbl_animalia a2 on a2.animalia_id=a1.species_animalia
		inner join tbl_class a3 on a3.class_id = a1.species_class
		inner join tbl_order a4 on a4.order_id=a1.species_order
		inner join tbl_habitat a5 on a5.habitat_id=a1.species_habitat
		inner join tbl_nutrition a6 on a6.nutrition_id = a1.species_nutrition
		inner join tbl_care a7 on a7.care_id=a1.species_care
		where species_name = 'ghost bat'
	;

end


select * from tbl_habitat;

select 

	a1.species_name 

from tbl_species a1

where species_order = 3
;

select * from tbl_nutrition;

select 
	a1.nutrition_type
from tbl_nutrition a1
where nutrition_cost < 600
;

select 
	a1.species_name
from tbl_species a1
where species_nutrition between 2202 and 2206
;

select 
	a1.species_name as 'Species Name',
	a2.nutrition_type as 'Nutrition Type'
from tbl_species a1
	inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
;

select * from tbl_species

select * from tbl_specialist

select * from tbl_care


select 
	specialist_fname,
	specialist_lname,
	specialist_contact
from tbl_specialist
	inner join tbl_care on tbl_care.care_specialist=tbl_specialist.specialist_id
	inner join tbl_species on tbl_species.species_care=tbl_care.care_id

where species_name = 'penguin'
;


