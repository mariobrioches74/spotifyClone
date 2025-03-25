delete from Playlists
delete from Users
delete from Songs
delete from Artists

INSERT INTO Users
VALUES 
('Federico', 'boccio'),
('Dario', 'marioBrioches'),
('Gianluca', 'capo'),
('Tommaso', 'worker')

INSERT INTO Artists
VALUES
('Gionata', 'Boschetti', 'SferaEbbasta')

INSERT INTO Songs
VALUES
('Panette', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '180'),
('Ciny', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '200'),
('Visiera A Becco', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '220'),
('Dexter', (SELECT id from Artists where [artname] = 'SferaEbbasta'), '190')

INSERT INTO Playlists 
VALUES 
('444',(SELECT UserId FROM Users WHERE [nickname] = 'boccio')),
('Tutto SferaEbbasta',(SELECT UserId FROM Users WHERE [nickname] = 'boccio')),
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

SELECT * from Users
SELECT * from Playlists
SELECT * from MusicTypes
SELECT * from PlaylistSongs
SELECT * from Songs
SELECT * from Artists