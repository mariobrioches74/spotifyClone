
USE Spotify

delete from SongMusicTypes
delete AlbumSongs
delete from PlaylistSongs
delete from Playlists
delete from Users
delete from Songs
delete from Artists
delete from Albums

DBCC CHECKIDENT ('dbo.Users', RESEED, 0);
GO
DBCC CHECKIDENT ('dbo.Playlists', RESEED, 0);
GO
DBCC CHECKIDENT ('dbo.Artists', RESEED, 0);
GO
DBCC CHECKIDENT ('dbo.Songs', RESEED, 0);
GO
DBCC CHECKIDENT ('dbo.Albums', RESEED, 0);
GO

INSERT INTO Users
VALUES 
('Federico', 'boccio'),
('Dario', 'marioBrioches'),
('Gianluca', 'capo'),
('Tommaso', 'worker')

INSERT INTO Artists
VALUES
('Gionata', 'Boschetti', 'SferaEbbasta'),
('Lorenzo', 'Vinciguerra', 'PapaV'),
('Morad', 'El Horami', 'Morad')



INSERT INTO Songs
VALUES
('Panette', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180', 'Panette'),
('Ciny', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200', 'Ciny'),
('Visiera A Becco', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '210', 'Visiera A Becco'),
('Dexter', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '190', 'Dexter'),

('Gol', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180', 'Gol'),
('Calcolatrici', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200', 'Calcolatrici'),
('3uphon', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '220', '3uphon'),
('Milano Bene', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '190', 'Milano Bene'),
('G63', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180', 'G63'),
('15 Piani', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200', '15 Piani'),

('Mattone', (SELECT id from Artists where [artname] = 'PapaV'), '180', 'Mattone'),
('Gesu Bambino', (SELECT id from Artists where [artname] = 'PapaV'), '200', 'Gesu Bambino'),
('Apparecchiato', (SELECT id from Artists where [artname] = 'PapaV'), '220', 'Apparecchiato'),
('Mafia Slime', (SELECT id from Artists where [artname] = 'PapaV'), '190', 'Mafia Slime'),

('Pelele', (SELECT id from Artists where [artname] = 'Morad'), '180', 'Pelele'),
('Se Grita', (SELECT id from Artists where [artname] = 'Morad'), '200', 'Se Grita'),
('Sigue', (SELECT id from Artists where [artname] = 'Morad'), '220', 'Sigue'),
('Sonar', (SELECT id from Artists where [artname] = 'Morad'), '190', 'Sonar')


INSERT INTO Playlists 
VALUES 
('444',(SELECT UserId FROM Users WHERE [nickname] = 'boccio')),
('TuttoSferaEbbasta',(SELECT UserId FROM Users WHERE [nickname] = 'boccio')),
('Sanse il top',(SELECT UserId FROM Users WHERE [nickname] = 'marioBrioches')),
('ITIS',(SELECT UserId FROM Users WHERE [nickname] = 'marioBrioches')),
('Prima Playlist',(SELECT UserId FROM Users WHERE [nickname] = 'capo')),
('Seconda Playlist',(SELECT UserId FROM Users WHERE [nickname] = 'capo')),
('MAFIA SLIME 1',(SELECT UserId FROM Users WHERE [nickname] = 'worker')),
('MAFIA SLIME 2',(SELECT UserId FROM Users WHERE [nickname] = 'worker'))
---------------------------------------
IF NOT EXISTS (SELECT TOP 1 * FROM dbo.MusicTypes)
BEGIN
    PRINT 'Non esiste MusicTypes, quindi lo popolo!'

    INSERT INTO dbo.MusicTypes ([type]) -- ADD UNIQUE TO [TYPE]
    VALUES 
    ('Rock'), ('Pop'), ('Jazz'), ('Blues'), ('Hip Hop'), ('Classical'), ('Reggae'), ('Country'), ('Electronic'), ('Folk'),
    ('Metal'), ('Punk'), ('R&B'), ('Soul'), ('Funk'), ('Disco'), ('House'), ('Techno'), ('Trance'), ('Dubstep'),
    ('Bluegrass'), ('Gospel'), ('Ska'), ('Swing'), ('Grunge'), ('Indie'), ('Alternative'), ('Industrial'), ('Opera'), ('Ambient'),
    ('EDM'), ('Latin'), ('Salsa'), ('Bachata'), ('Merengue'), ('Flamenco'), ('Cumbia'), ('Reggaeton'), ('Afrobeat'), ('K-Pop'),
    ('J-Pop'), ('Synthwave'), ('Lo-Fi'), ('Drum and Bass'), ('Trap'), ('Hardstyle'), ('Chillout'), ('New Age'), ('Soundtrack'), ('World Music');
     
     PRINT 'Popolato MusicTypes'
END
ELSE
BEGIN
    PRINT 'MusicTypes ha già della roba dentro'
END
---------------------------------------------------------------
INSERT INTO PlaylistSongs
VALUES
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'Panette')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'Ciny')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'Visiera A Becco')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'Dexter')),

((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Sigue')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Pelele')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Sonar')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Se Grita'))
-----------------------------------------------------------------------------------

INSERT INTO Albums
VALUES
('X2VR', 'X2VR'),
('Trap Fatta Bene', 'TFB'),
('Reinsertado', 'REINSERTADO')
-------------------------------------------------------------------
INSERT INTO AlbumSongs
VALUES
((SELECT id from Songs where [title] = 'Gol'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'Calcolatrici'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = '3uphon'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'Milano Bene'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'G63'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = '15 Piani'), (SELECT albumId from Albums where [name] = 'X2VR'))
------------------------------------------------------------------------
INSERT INTO SongMusicTypes
VALUES
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Gol')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Calcolatrici')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = '3uphon')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Milano Bene')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'G63')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = '15 Piani')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Dexter')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Panette')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Ciny')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Visiera A Becco')),

((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Sigue')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Pelele')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Se Grita')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Sonar'))
---------------------------------------------------------------------------------------------------------------

SELECT * from Users
SELECT * from Playlists
SELECT * from PlaylistSongs
SELECT * from Songs
SELECT * from Artists
SELECT * from Albums
SELECT * from AlbumSongs
SELECT * from MusicTypes
SELECT * from SongMusicTypes
