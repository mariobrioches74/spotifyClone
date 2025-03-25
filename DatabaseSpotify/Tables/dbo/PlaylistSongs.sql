create table dbo.PlaylistSongs(
  playlistId int,
  songId int,
  CONSTRAINT FK_PlaylistSongs_Playlists_playlistId FOREIGN KEY ([playlistId]) REFERENCES [dbo].[Playlists] ([playlistId]),
  CONSTRAINT FK_PlaylistSongs_Songs_id FOREIGN KEY ([songId]) REFERENCES [dbo].[Songs] ([id])
)