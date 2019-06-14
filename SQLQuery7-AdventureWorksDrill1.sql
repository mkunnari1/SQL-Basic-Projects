use AdventureWorks2014
go

create procedure dbo.uspGetAddress
as 
select * from Person.address 
go

exec dbo.uspGetAddress

alter procedure dbo.upsGetAddress @City nvarchar(30) = null
as
select *
from Person.Address
where City = isnull (@city,city)

go

drop procedure dbo.upsGetAddress

exec dbo.upsGetAddress @city = 'Bothell' 


select * from person.address

select * from person.AddressType

select * from person.StateProvince

use AdventureWorks2014
go 

create procedure dbo.getcCountryRegionCode @StateProvinceID nvarchar(30) = null , @City nvarchar(50) = null
as
select CountryRegionCode, name, person.address.StateProvinceID,City
from Person.StateProvince
	full outer join person.Address on person.Address.StateProvinceID=person.StateProvince.StateProvinceID

	where person.address.StateProvinceID like '%' + isnull(@StateProvinceID,person.address.StateProvinceID)
	and city like '%' + isnull(@city,city) 
go

exec dbo.getcCountryRegionCode @stateprovinceid = '1'
