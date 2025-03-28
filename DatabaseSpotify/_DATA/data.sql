
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
('Gionata', 'Boschetti', 'SferaEbbasta', 'SFERAEBBASTA.jpg'),
('Lorenzo', 'Vinciguerra', 'PapaV', 'PAPAV.jpg'),
('Morad', 'El Horami', 'Morad', 'MORAD.jpg'),
('Lamine', 'Saida', 'Simba La Rue', 'SIMBA LA RUE.jpg'),
('William', 'Hickman', 'Mambolosco', 'MAMBOLOSCO.jpg'),
('Alternate', 'Direct', 'ACDC', 'ACDC.jpg')



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
('Cristales', (SELECT id from Artists where [artname] = 'Morad'), '190', 'Se Grita.jpg'),
('Paz', (SELECT id from Artists where [artname] = 'Morad'), '190', 'Se Grita.jpg'),
('Mi Barrio', (SELECT id from Artists where [artname] = 'Morad'), '190', 'Se Grita.jpg'),
('Estopa', (SELECT id from Artists where [artname] = 'Morad'), '190', 'Se Grita.jpg'),

('Batman', (SELECT id from Artists where [artname] = 'Simba La Rue'), '180', 'Batman.jpg'),
('SUITE HOTEL', (SELECT id from Artists where [artname] = 'Simba La Rue'), '200', 'SUITE HOTEL.jpg'),
('TUNNEL', (SELECT id from Artists where [artname] = 'Simba La Rue'), '220', 'TUNNEL.jpg'),
('COPACABANA', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'COPACABANA.jpg'),
('TAF TAF', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'TAF TAF.jpg'),
('ACCAVALLATO', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'ACCAVALLATO.jpg'),
('Cagoule', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'Cagoule.jpg'),
('VRP', (SELECT id from Artists where [artname] = 'Simba La Rue'), '190', 'VRP.jpg'),
('LEVANTE', (SELECT id from Artists where [artname] = 'Simba La Rue'), '220', 'LEVANTE.jpg'),
('LATITANTE', (SELECT id from Artists where [artname] = 'Simba La Rue'), '220', 'LATITANTE.jpg'),
('HOOD', (SELECT id from Artists where [artname] = 'Simba La Rue'), '220', 'HOOD.jpg'),

('Thick', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Thick.jpg'),
('Costa Tanto', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Costa Tanto.jpg'),
('Palazzo Parigi', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Palazzo Parigi.jpg'),
('Offline', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Offline.jpg'),
('Mazzette', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Mazzette.jpg'),
('Vodka', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Vodka.jpg'),
('CONNESSIONI', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'CONNESSIONI.jpg'),
('HARDER', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'HARDER.jpg'),
('Street', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Street.jpg'),
('Facendo Faccende', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Facendo Faccende.jpg'),
('Karma', (SELECT id from Artists where [artname] = 'Mambolosco'), '190', 'Karma.jpg'),

('Thunderstruck', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Thunderstruck.jpg'),
('Highway To Hell', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Highway To Hell.jpg'),
('Back In Black', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Back In Black.jpg'),
('TNT', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'TNT.jpg'),
('Hells Bells', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Hells Bells.jpg'),

('Realize', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Realize.jpg'),
('Rejection', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Realize.jpg'),
('Demon Fire', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Realize.jpg'),
('Shot In The Dark', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Realize.jpg'),
('Wild Reputation', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Realize.jpg'),
('Code Red', (SELECT id from Artists where [artname] = 'ACDC'), '190', 'Realize.jpg')


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
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'LEVANTE')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'LATITANTE')),
((SELECT playlistId from Playlists where [name] = 'Prima Playlist'), (SELECT id from Songs where [title] = 'HOOD')),

((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Mattone')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Apparecchiato')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Mafia Slime')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 1'), (SELECT id from Songs where [title] = 'Gesu Bambino')),

((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Sigue')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Pelele')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Sonar')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Se Grita')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Cristales')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Paz')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Mi Barrio')),
((SELECT playlistId from Playlists where [name] = 'ITIS'), (SELECT id from Songs where [title] = 'Estopa')),

((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Ciny')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Visiera A Becco')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Dexter')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Gol')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Calcolatrici')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Mattone')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Apparecchiato')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'TAF TAF')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'ACCAVALLATO')),
((SELECT playlistId from Playlists where [name] = '444'), (SELECT id from Songs where [title] = 'Cagoule')),

((SELECT playlistId from Playlists where [name] = 'Sanse il top'), (SELECT id from Songs where [title] = 'ACCAVALLATO')),
((SELECT playlistId from Playlists where [name] = 'Sanse il top'), (SELECT id from Songs where [title] = 'Gol')),
((SELECT playlistId from Playlists where [name] = 'Sanse il top'), (SELECT id from Songs where [title] = 'Ciny')),
((SELECT playlistId from Playlists where [name] = 'Sanse il top'), (SELECT id from Songs where [title] = 'Karma')),
((SELECT playlistId from Playlists where [name] = 'Sanse il top'), (SELECT id from Songs where [title] = 'Mazzette')),
((SELECT playlistId from Playlists where [name] = 'Sanse il top'), (SELECT id from Songs where [title] = 'TAF TAF')),

((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Costa Tanto')),
((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Palazzo Parigi')),
((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Sigue')),
((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Pelele')),
((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Apparecchiato')),
((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Gesu Bambino')),
((SELECT playlistId from Playlists where [name] = 'Seconda Playlist'), (SELECT id from Songs where [title] = 'Batman')),

((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'LEVANTE')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'Mattone')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'HOOD')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'COPACABANA')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'Sonar')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'ACCAVALLATO')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'Mafia Slime')),
((SELECT playlistId from Playlists where [name] = 'MAFIA SLIME 2'), (SELECT id from Songs where [title] = 'Dexter'))


-----------------------------------------------------------------------------------

INSERT INTO Albums
VALUES
('X2VR', 'X2VR.jpg'),
('Trap Fatta Bene', 'TFB.jpg'),
('Reinsertado', 'REINSERTADO.jpg'),
('TUNNEL', 'TUNNEL.jpg'),
('Facendo Faccende', 'FACENDO FACCENDE.jpg'),
('POWER UP', 'POWER UP.jpg')
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
((SELECT id from Songs where [title] = 'Sonar'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Cristales'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Paz'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Mi Barrio'), (SELECT albumId from Albums where [name] = 'Reinsertado')),
((SELECT id from Songs where [title] = 'Estopa'), (SELECT albumId from Albums where [name] = 'Reinsertado')),

((SELECT id from Songs where [title] = 'Palazzo Parigi'), (SELECT albumId from Albums where [name] = 'Facendo Faccende')),
((SELECT id from Songs where [title] = 'Street'), (SELECT albumId from Albums where [name] = 'Facendo Faccende')),
((SELECT id from Songs where [title] = 'Facendo Faccende'), (SELECT albumId from Albums where [name] = 'Facendo Faccende')),
((SELECT id from Songs where [title] = 'Vodka'), (SELECT albumId from Albums where [name] = 'Facendo Faccende')),
((SELECT id from Songs where [title] = 'Offline'), (SELECT albumId from Albums where [name] = 'Facendo Faccende')),
((SELECT id from Songs where [title] = 'Karma'), (SELECT albumId from Albums where [name] = 'Facendo Faccende')),

((SELECT id from Songs where [title] = 'TUNNEL'), (SELECT albumId from Albums where [name] = 'TUNNEL')),
((SELECT id from Songs where [title] = 'LEVANTE'), (SELECT albumId from Albums where [name] = 'TUNNEL')),
((SELECT id from Songs where [title] = 'LATITANTE'), (SELECT albumId from Albums where [name] = 'TUNNEL')),
((SELECT id from Songs where [title] = 'HOOD'), (SELECT albumId from Albums where [name] = 'TUNNEL')),

((SELECT id from Songs where [title] = 'Realize'), (SELECT albumId from Albums where [name] = 'POWER UP')),
((SELECT id from Songs where [title] = 'Rejection'), (SELECT albumId from Albums where [name] = 'POWER UP')),
((SELECT id from Songs where [title] = 'Demon Fire'), (SELECT albumId from Albums where [name] = 'POWER UP')),
((SELECT id from Songs where [title] = 'Shot In The Dark'), (SELECT albumId from Albums where [name] = 'POWER UP')),
((SELECT id from Songs where [title] = 'Wild Reputation'), (SELECT albumId from Albums where [name] = 'POWER UP')),
((SELECT id from Songs where [title] = 'Code Red'), (SELECT albumId from Albums where [name] = 'POWER UP'))


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
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Mattone')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Apparecchiato')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'Mafia Slime')),
((SELECT id from MusicTypes where [type] = 'Trap'), (SELECT id from Songs where [title] = 'Gesu Bambino')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'LEVANTE')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'ACCAVALLATO')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'Palazzo Parigi')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'Costa Tanto')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'COPACABANA')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'Batman')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'SUITE HOTEL')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'HOOD')),
((SELECT id from MusicTypes where [type] = 'Trap'),(SELECT id from Songs where [title] = 'CONNESSIONI')),

((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Sigue')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Pelele')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Se Grita')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Sonar')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Cristales')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Paz')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Mi Barrio')),
((SELECT id from MusicTypes where [type] = 'Reggaeton'), (SELECT id from Songs where [title] = 'Estopa')),

((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Thunderstruck')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Highway To Hell')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Back In Black')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'TNT')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Hells Bells')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Realize')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Rejection')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Demon Fire')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Shot In The Dark')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Wild Reputation')),
((SELECT id from MusicTypes where [type] = 'Rock'), (SELECT id from Songs where [title] = 'Code Red'))
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
