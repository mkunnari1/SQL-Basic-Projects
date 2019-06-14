
use db_zoo
go

create table tbl_habitat (
		habitat_id int primary key not null identity(5000,1),
		habitat_type varchar(50),
		habitat_cost money not null
	);

insert into tbl_habitat (habitat_type, habitat_cost)
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