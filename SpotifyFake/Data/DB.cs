using SpotifyFake.Models;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Linq;

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

        public List<Albums> GetAlbums()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT albumId, name, imgCode FROM dbo.Albums";
                var albums = connection.Query<Albums>(query).ToList();
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

        public List<Playlists> GetPlaylists()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT playlistId, name, userId FROM dbo.Playlists";
                var playlists = connection.Query<Playlists>(query).ToList();
                return playlists;
            }
        }

        public List<Songs> GetPlaylistSongs(int playlistId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
                SELECT S.*,ArtistName = A.name, ArtistArtName = a.artname,ArtistSurName = a.surname
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
                ArtistArtName = a.artname
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
                S.*
                FROM dbo.Songs S
                INNER JOIN dbo.Artists A ON A.id = S.artistid
                WHERE A.Id =  @artistId";
                var songs = connection.Query<Songs>(query, new { artistId }).ToList();
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

    }
}
