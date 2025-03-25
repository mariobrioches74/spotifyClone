create table dbo.Users(
  userId int identity,
  [name] varchar(100),
  [nickname] varchar(100) unique,
  CONSTRAINT PK_Users_userId PRIMARY KEY (userId)
)