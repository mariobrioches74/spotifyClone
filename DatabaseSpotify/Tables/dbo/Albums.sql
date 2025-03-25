create table dbo.Albums(
  albumId int identity,
  numSongs int,
  CONSTRAINT PK_Albums_albumId PRIMARY KEY (albumId)
)