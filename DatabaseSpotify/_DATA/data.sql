delete from Playlists
delete from Users



INSERT INTO Users 
VALUES 
('Federico'),
('Dario'),
('Gianluca')

INSERT INTO Playlists 
VALUES 
('Canzoni al top',(SELECT UserId FROM Users WHERE [Name] = 'Federico')),
('Marcella Bella TOPPER SONGS',(SELECT UserId FROM Users WHERE [Name] = 'Federico')),
('Sanse il top',(SELECT UserId FROM Users WHERE [Name] = 'Dario')),
('ITIS',(SELECT UserId FROM Users WHERE [Name] = 'Dario')),
('Unica Playlist della mia vita',(SELECT UserId FROM Users WHERE [Name] = 'Federico'))

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

SELECT *  from Users
SELECT * from Playlists

select * from dbo.MusicTypes