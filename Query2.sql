print 'Hello World'

declare @myvariable int 
set @myvariable = 47
print @myvariable

declare @var1 int, @var2 int
set @var1 = 69
set @var2 = 420

print 'Having fun with'+' TSQL and MS SQL SERVER!'

print char(9)+ 'I have ' + convert (varchar(50),@var1) + char(13) + ' dollars...'


if @var1 != 3
	begin
		print 'Variable 1 is Not = 3 it is ' + convert (varchar(5),@var1) +char(13)

	end

else
	begin
		print 'Variable 1 is not < ' + convert (varchar(5),@var1) + char(13)
	end




/* this is the syntax for commenting in SQL */ 



