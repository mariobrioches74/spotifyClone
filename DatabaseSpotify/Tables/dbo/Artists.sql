create table dbo.Artists(
  id int identity,
  [name] varchar(100),
  surname varchar(100),
  artname varchar(100),
  imgCode varchar(MAX),
  CONSTRAINT PK_Artists_id PRIMARY KEY (id)
)