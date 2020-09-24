drop database if exists MMR
GO
create database MMR
GO
use MMR
GO
DROP TABLE IF EXISTS emp,dept

create table dept(
did int primary key,
dname varchar(20)
)

create table emp(
eid int identity,
ename varchar(20),
eadress varchar(20) default 'Sharkia',
hiredate date default getdate(),
BD date,
age as(year(getdate())-year(BD)),
sal int,
overtime int,
--isnull(column,value) if any record is null replace it with 0
netsal as(isnull(sal,0)+isnull(overtime,0)),  --driven attribute , no physical space on HDD
netsalary as(sal+overtime) persisted,  -- save on HDD
hour_rate int not null,
gender varchar(1),
dept_id int
constraint c1 primary key (eid,ename),
constraint c2 unique (sal),
constraint c3 unique (hour_rate),
constraint c4 check(sal>1000),
constraint c5 check (eadress in('alex','cairo','mansoura','sharkia')),
constraint c6 check (overtime between 100 and 1000),
constraint c7 check (gender in('F','M')),
constraint c8 foreign key (dept_id) references dept(did)
on delete set null on update cascade
)