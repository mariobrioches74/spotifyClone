create table dbo.Songs(
  id int identity,
  title varchar(100),
  artistid int,
  [time] int,
  imgCode varchar(MAX),
  CONSTRAINT PK_Songs_id PRIMARY KEY (id),
  CONSTRAINT FK_Songs_Artists_id FOREIGN KEY ([artistId]) REFERENCES [dbo].[Artists] ([id])
)