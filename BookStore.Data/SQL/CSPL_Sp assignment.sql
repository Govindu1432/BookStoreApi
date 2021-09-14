create database masterTab
use masterTab

create table FamilyMem(Mid int primary key, Fname varchar(40), Lname varchar(40),Income int, Work varchar(40)) 

insert into FamilyMem values(1,'Ram','chintha',40000,'soft Engg')
insert into FamilyMem values(2,'Naresh','Neeru',25000,'soft dev')

select * from FamilyMem

create table FamilyExp(Eid int primary key, Mid int, Purpose var+
char(40),Amount int, foreign key(Mid) references FamilyMem(Mid))
insert into FamilyExp values 

(1,2,'Shopping',10000),
(2,1,'Groceries',1500);

select * from FamilyMem
select * from FamilyExp

select * from FamilyMem fm join FamilyExp fe on fm.Mid=fe.Mid 

------------stored procedure

create proc FamilyDet
(@Mid int, @Fname varchar(40),@lname varchar(40), @income int ,@work varchar(40),@Eid int, @Purpose varchar(40), @Amount int)
as begin
insert into FamilyMem values (@Mid,@Fname,@lname,@income,@work)
insert into FamilyExp values (@Eid,@Mid,@Purpose,@Amount)
end


exec FamilyDet 4,'venky','veena',27000,'Weaver',3,'Mobile Purchased',15000
exec FamilyDet 5,'Raju','Chinnu',0,'Student',5,'School Fee',54000



select * from FamilyMem
select * from FamilyExp
select * from FamilyMem fm join FamilyExp fe on fm.Mid=fe.Mid 




