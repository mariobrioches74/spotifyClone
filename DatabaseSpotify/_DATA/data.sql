
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
('Morad', 'El Horami', 'Morad'),
('Lamine', 'Saida', 'Simba La Rue'),
('William', 'Hickman', 'Mambolosco')



INSERT INTO Songs
VALUES
('Panette', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180', 'Panette.jpg'),
('Ciny', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200', 'Ciny.jpg'),
('Visiera A Becco', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '210', 'Visiera A Becco.jpg'),
('Dexter', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '190', 'Dexter.jpg'),

('Gol', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180', 'Gol.jpg'),
('Calcolatrici', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200', 'Calcolatrici.jpg'),
('3uphon', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '220', '3uphon.jpg'),
('Milano Bene', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '190', 'Milano Bene.jpg'),
('G63', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180', 'G63.jpg'),
('15 Piani', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200', '15 Piani.jpg'),

('Mattone', (SELECT id from Artists where [artname] = 'PapaV'), '180', 'Mattone.jpg'),
('Gesu Bambino', (SELECT id from Artists where [artname] = 'PapaV'), '200', 'Gesu Bambino.jpg'),
('Apparecchiato', (SELECT id from Artists where [artname] = 'PapaV'), '220', 'Apparecchiato.jpg'),
('Mafia Slime', (SELECT id from Artists where [artname] = 'PapaV'), '190', 'Mafia Slime.jpg'),

('Pelele', (SELECT id from Artists where [artname] = 'Morad'), '180', 'Pelele.jpg'),
('Se Grita', (SELECT id from Artists where [artname] = 'Morad'), '200', 'Se Grita.jpg'),
('Sigue', (SELECT id from Artists where [artname] = 'Morad'), '220', 'Sigue.jpg'),
('Sonar', (SELECT id from Artists where [artname] = 'Morad'), '190', 'Sonar.jpg'),

('Batman', (SELECT id from Artists where [artname] = 'Simba La Rue'), '180', 'Batman.jpg'),
('SUITE HOTEL', (SELECT id from Artists where [artname] = 'Simba La Rue'), '200', 'SUITE HOTEL.jpg'),
('TUNNEL', (SELECT id from Artists where [artname] = 'Simba La Rue'), '220', 'TUNNEL.jpg'),
('COPACABANA', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'COPACABANA.jpg'),
('TAF TAF', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'TAF TAF.jpg'),
('ACCAVALLATO', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'ACCAVALLATO.jpg'),
('Cagoule', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'Cagoule.jpg'),
('VRP', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'VRP.jpg')


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
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'Gol')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'Calcolatrici')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = '15 Piani')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = 'G63')),
((SELECT playlistId from Playlists where [name] = 'TuttoSferaEbbasta'), (SELECT id from Songs where [title] = '3uphon')),

((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'Batman')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'SUITE HOTEL')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'TUNNEL')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'COPACABANA')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'TAF TAF')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'ACCAVALLATO')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'Cagoule')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'VRP')),

((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Mattone')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Apparecchiato')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Mafia Slime')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Gesu Bambino')),

((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Sigue')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Pelele')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Sonar')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Se Grita'))
-----------------------------------------------------------------------------------

INSERT INTO Albums
VALUES
('X2VR', 'X2VR.jpg'),
('Trap Fatta Bene', 'TFB.jpg'),
('Reinsertado', 'REINSERTADO.jpg')
-------------------------------------------------------------------
INSERT INTO AlbumSongs
VALUES
((SELECT id from Songs where [title] = 'Gol'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'Calcolatrici'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = '3uphon'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'Milano Bene'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'G63'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = '15 Piani'), (SELECT albumId from Albums where [name] = 'X2VR')),
((SELECT id from Songs where [title] = 'Mattone'), (SELECT albumId from Albums where [name] = 'Trap Fatta Bene')),
((SELECT id from Songs where [title] = 'Gesu Bambino'), (SELECT albumId from Albums where [name] = 'Trap Fatta Bene')),
((SELECT id from Songs where [title] = 'Apparecchiato'), (SELECT albumId from Albums where [name] = 'Trap Fatta Bene')),
((SELECT id from Songs where [title] = 'Mafia Slime'), (SELECT albumId from Albums where [name] = 'Trap Fatta Bene')),
((SELECT id from Songs where [title] = 'Pelele'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Se Grita'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Sigue'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Sonar'), (SELECT albumId from Albums where [name] = 'Reinsertado'))

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
