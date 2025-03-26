create table dbo.Albums(
  [albumId] int identity,
  [name] varchar(100),
  imgCode varchar(MAX),
  CONSTRAINT PK_Albums_albumId PRIMARY KEY (albumId)
)