using SpotifyFake.Models;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;

namespace SpotifyFake.Data
{
    public class DatabaseAccess
    {
        private readonly string _connectionString;

        public DatabaseAccess()
        {
            //_connectionString = "Data Source=localhost;Database=Spotify;Integrated Security = SSPI;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Connect Timeout=60;Encrypt=False;TrustServerCertificate=True";
            _connectionString = "Data Source=localhost;Database=Spotify;uid=sa;password=Isolutions2021;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Connect Timeout=60;Encrypt=False;TrustServerCertificate=True";
        }

        public List<Albums> GetAlbums(int? artistId)
        {

            string query = @"SELECT * FROM dbo.Albums A ";
            if(artistId is not null)
            {
                query = (@" SELECT DISTINCT A.*, ArtistArtName = AR.artname FROM dbo.Albums A
                            INNER JOIN dbo.AlbumSongs ASS ON ASS.albumId = A.albumId
                            INNER JOIN dbo.Songs S ON ASS.songId = S.id
                            INNER JOIN dbo.Artists AR ON AR.id = S.artistid 
                            WHERE A.albumId = @artistId");
            }
            using (var connection = new SqlConnection(_connectionString))
            {
                var albums = connection.Query<Albums>(query, new {artistId}).ToList();
                return albums;
            }
        }

        public List<AlbumSongs> GetAlbumSongs()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT songId, albumId FROM dbo.AlbumSongs";
                var albumSongs = connection.Query<AlbumSongs>(query).ToList();
                return albumSongs;
            }
        }

        public List<Artists> GetArtists()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT id, name, surname, artname, imgCode FROM dbo.Artists";
                var artists = connection.Query<Artists>(query).ToList();
                return artists;
            }
        }

        public List<MusicTypes> GetMusicTypes()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT id, type FROM dbo.MusicTypes";
                var musicTypes = connection.Query<MusicTypes>(query).ToList();
                return musicTypes;
            }
        }
        public List<PlaylistSongs> GetPSongs()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT playlistId, songId FROM dbo.PlaylistSongs";
                var ps = connection.Query<PlaylistSongs>(query).ToList();
                return ps;
            }
        }
        public Songs GetSongDetail(int songId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                SELECT S.*,
                ArtistArtName = a.artname,
                ArtistId = a.id
                FROM dbo.Songs S
                INNER JOIN dbo.Artists A ON A.id = S.artistid
                WHERE s.id = @songId";
                var song = connection.Query<Songs>(query, new { songId }).ToList();
                return song[0];
            }
        }


        public List<Playlists> GetPlaylists(int? playlistId)
        {
            string query = @"SELECT playlistId, name, userId FROM dbo.Playlists";

            if (playlistId is not null)
            {
                query += (" WHERE playlistId = @playlistId");
            }
            using (var connection = new SqlConnection(_connectionString))
            {
                var playlists = connection.Query<Playlists>(query, new { playlistId }).ToList();
                return playlists;
            }
        }

        public List<Songs> GetPlaylistSongs(int playlistId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                SELECT S.*,ArtistName = A.name, ArtistArtName = a.artname,ArtistSurName = a.surname,ArtistId = a.id
                FROM dbo.PlaylistSongs PS
                INNER JOIN dbo.Songs S ON PS.songId = S.id
                INNER JOIN dbo.Artists A ON A.id = S.artistid
                WHERE PS.playlistId = @playlistId";
                var songs = connection.Query<Songs>(query, new { playlistId }).ToList();
                return songs;
            }
        }

        public List<Songs> GetAlbumSongs(int albumId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                SELECT 
                S.*,
                ArtistArtName = a.artname,ArtistId = a.id
                FROM dbo.AlbumSongs ASS
                INNER JOIN dbo.Songs S ON ASS.songId = S.id
                INNER JOIN dbo.Artists A ON A.id = S.artistid
                WHERE ASS.albumId =  @albumId";
                var songs = connection.Query<Songs>(query, new { albumId }).ToList();
                return songs;
            }
        }

        public List<Songs> GetArtistSongs(int artistId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                SELECT 
                S.*,
                ArtistArtName = a.artname
                FROM dbo.Songs S
                INNER JOIN dbo.Artists A ON A.id = S.artistid
                WHERE A.Id = @artistId";
                var songs = connection.Query<Songs>(query, new { artistId }).ToList();
                return songs;
            }
        }

        public List<Songs> GetGenreSongs(int typeId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                SELECT 
                S.*,
                ArtistArtName = a.artname,ArtistId = a.id
                FROM dbo.SongMusicTypes SMT
                INNER JOIN dbo.Songs S ON SMT.songId = S.id
                INNER JOIN dbo.Artists A on S.artistid = a.id
                WHERE SMT.musicTypeId = @typeId";
                var songs = connection.Query<Songs>(query, new { typeId }).ToList();
                return songs;
            }
        }

        public List<SongMusicTypes> GetSongMusicTypes()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT musicTypeId, songId FROM dbo.SongMusicTypes";
                var songMusicTypes = connection.Query<SongMusicTypes>(query).ToList();
                return songMusicTypes;
            }
        }

        public List<Songs> GetSongs(int? playlistId, int? albumId)
        {

            string query = @"
                SELECT 
                s.id, 
                title, 
                artistid, 
                [time], 
                s.imgCode,
                ArtistArtName =A.artname,
                ArtistName = A.name,
                ArtistSurname = A.surname,
                ArtistImgcode = A.imgCode
                FROM dbo.Songs S
                INNER JOIN dbo.Artists A ON A.id = S.artistid";

            if (playlistId is not null )
            {
                query += (" INNER JOIN dbo.PlaylistSongs PS ON PS.songId = S.id AND PS.playlistId = @playlistId");
            }
            if (albumId is not null)
            {
                query.Concat(" INNER JOIN dbo.AlbumSongs ASS ON ASS.songId = S.id AND ASS.albumId = @albumId");
            }

            using (var connection = new SqlConnection(_connectionString))
            {
                
                    var songs = connection.Query<Songs>(query, new { playlistId , albumId }).ToList();
                    return songs;

                    
            }
        }

        public List<Users> GetUsers()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT userId, name, nickname FROM dbo.Users";
                var users = connection.Query<Users>(query).ToList();
                return users;
            }
        }


        #region alterDBMethods
        public void newPlaylist(Playlists newPlaylist)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                INSERT INTO Playlists 
                VALUES 
                (@playlistName,1)";
                connection.Execute(query, new { playlistName = newPlaylist.name});
            }
        }

        public void DeletePlaylist(int playListID)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                DELETE FROM PlaylistSongs WHERE PlaylistId = @playListID
                DELETE FROM Playlists WHERE PlaylistId = @playListID
                ";
                connection.Execute(query, new { playListID });
            }
        }
        public void AddSongsToPlaylist(int playlistID, int songID)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                INSERT INTO PlaylistSongs
                VALUES
                (@playlistID, @songID)";
                connection.Execute(query, new { playlistID, songID });
            }
        }

        public void DeleteSongsFromPlaylist(int playlistID, int songID)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                DELETE FROM PlaylistSongs
                WHERE playlistId = @playlistID AND 
                songId = @songID";
                connection.Execute(query, new { playlistID, songID });
            }
        }

        #endregion
    }
}
