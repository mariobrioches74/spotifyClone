create table dbo.AlbumSongs(
  songId int,
  albumId int,
  CONSTRAINT FK_AlbumSongs_Songs_id FOREIGN KEY ([songId]) REFERENCES [dbo].[Songs] ([id]),
  CONSTRAINT FK_AlbumSongs_Albums_albumId FOREIGN KEY ([albumId]) REFERENCES [dbo].[Albums] ([albumId])
)