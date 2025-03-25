create table dbo.SongMusicTypes(
  musicTypeId int,
  songId int,
  CONSTRAINT FK_SongMusicTypes_MusicTypes_id FOREIGN KEY ([musicTypeId]) REFERENCES [dbo].[MusicTypes] ([id]),
  CONSTRAINT FK_SongMusicTypes_Songs_id FOREIGN KEY ([songId]) REFERENCES [dbo].[Songs] ([id])
)