create table dbo.Albums(
  albumId int identity,
  numSongs int,
  [name] varchar(100),
  CONSTRAINT PK_Albums_albumId PRIMARY KEY (albumId)
)