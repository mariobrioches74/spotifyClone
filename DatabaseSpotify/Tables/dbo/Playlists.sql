create table dbo.Playlists
(
  playlistId int identity,
  [name] varchar(100),
  userId int, 
  CONSTRAINT PK_Playlists_playlistId PRIMARY KEY (playlistId),
  CONSTRAINT FK_Playlists_Users_userId FOREIGN KEY ([userId]) REFERENCES [dbo].[Users] ([userId])
)