USE [exercises]
GO

/****** Object:  Table [dbo].[Mobile prices classification]    Script Date: 3/21/2024 12:33:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Mobile prices classification](
	[id] [smallint] NOT NULL,
	[battery_power] [smallint] NOT NULL,
	[blue] [bit] NOT NULL,
	[clock_speed] [float] NOT NULL,
	[dual_sim] [bit] NOT NULL,
	[fc] [tinyint] NOT NULL,
	[four_g] [bit] NOT NULL,
	[int_memory] [tinyint] NOT NULL,
	[m_dep] [float] NOT NULL,
	[mobile_wt] [tinyint] NOT NULL,
	[n_cores] [tinyint] NOT NULL,
	[pc] [tinyint] NOT NULL,
	[px_height] [smallint] NOT NULL,
	[px_width] [smallint] NOT NULL,
	[ram] [smallint] NOT NULL,
	[sc_h] [tinyint] NOT NULL,
	[sc_w] [tinyint] NOT NULL,
	[talk_time] [tinyint] NOT NULL,
	[three_g] [bit] NOT NULL,
	[touch_screen] [bit] NOT NULL,
	[wifi] [bit] NOT NULL
) ON [PRIMARY]
GO

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