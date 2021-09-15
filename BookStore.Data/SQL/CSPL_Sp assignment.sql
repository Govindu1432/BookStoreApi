create database masterTab
use masterTab

create table FamilyMem1
(
Mid1 int primary key identity,
Fname varchar(40),
Lname varchar(40),
Income int, Work varchar(40)
) 



select * from FamilyMem1
select * from FamilyExp1


create table FamilyExp1
(
Eid int primary key identity,
Purpose varchar(40),
Amount int, 
Mid1 int foreign key references FamilyMem1(Mid1)
)

------------stored procedure

alter proc FamilyDet
(
@Fname varchar(40),
@lname varchar(40),
@income int ,
@work varchar(40),
@Purpose varchar(40),
@Amount int)
as
begin
insert into FamilyMem1(Fname,Lname,Income,Work) values (@Fname,@lname,@income,@work)
declare @id int
select @id=SCOPE_IDENTITY()
insert into FamilyExp1(Purpose,Amount,Mid1)values(@Purpose,@Amount,@id)
end

exec FamilyDet 'govind','govind1',1000,'emp','repair',2000 
exec FamilyDet 'rahul','c',0,'student','fee',5000
select * from FamilyMem1
select * from FamilyExp1
--select * from FamilyMem fm join FamilyExp fe on fm.Mid=fe.Mid 

--------------fetching data

alter procedure FetchAllData
(
@id int,

@Fname varchar(20)
)
as
begin
 if(isnull(@id,'') != '')
 begin
select b.Mid1,b.Fname,b.Lname,b.Income,b.work,b1.Purpose,
b1.Amount,b1.Eid
from FamilyMem1 b join FamilyExp1 b1
on b.Mid1=b1.Mid1
and (b.Mid1=@id or b.Fname=@Fname)
end
else
begin 
select  b.Mid1,b.Fname,b.Lname,b.Income,b.work,b1.Purpose,
b1.Amount,b1.Eid
from FamilyMem1 b join FamilyExp1 b1
on b.Mid1=b1.Mid1
 end
end

exec FetchAllData 3,''

select * from FamilyMem1
select * from FamilyExp1