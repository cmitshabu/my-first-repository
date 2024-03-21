---STEP 1---
--question : what is the first date ?
  
  ---STEP 2------what is the first date ?
  
  --- let start with the query and find the answer fro this question

  --STEP 3-----
  select 'hello world' as my_massage
         , GETdate () as current_battery_power


---STEP4---create a view--

DROP VIEW IF EXISTS dbo.v_hello_world_load;
go
create view dbo.v_hello_world_load
as
select 'hello world' as my_massage
       ,getdate() as current_battery_power

 --STEP 5---Turn the View into a Table---

select v.my_massage
    , v.current_battery_power
    into dbo.t_hello_world
from dbo.v_hello_world_load as V;

---STEP6--- Load the Table from the View using an Ad Hoc SQL Script---

drop table if exists dbo.t_hello_world;
go
create table dbo.t_hello_world
(my_massage		varchar(25) not null,
current_battery_power datetime not  null
                       default getdate (),
constraint pk_t_hello_world primary key clustered (my_massage ASC)
);
go

----STEP 6------Load the Table from the View using an Ad Hoc SQL Script--

truncate table dbo.t_hello_world;
  insert into dbo.t_hello_world
  select my_massage
  ,v.current_battery_power
  from dbo.v_hello_world_load as v;


  ---STEP7--- Turn the Ad Hoc SQL Script in a Stored Procedure

CREATE PROCEDURE 
dbo.usp_hello_world_load
as
begin
	truncate table dbo.t_hello_world;
  insert into dbo.t_hello_world
  select my_massage
  ,v.current_battery_power
  from dbo.v_hello_world_load as v;
  select t.*
  from dbo.t_hello_world as t;
  end;
  go

  ---STEP 8---Call the Stored Procedure
 
 exec dbo.usp_hello_world_load;