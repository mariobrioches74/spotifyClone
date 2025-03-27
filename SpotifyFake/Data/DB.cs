using SpotifyFake.Models;
using Dapper;
using Microsoft.Data.SqlClient;

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
                string query = @"SELECT id, name, surname, artname FROM dbo.Artists";
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

        public List<PlaylistSongs> GetPlaylistSongs()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT playlistId, songId FROM dbo.PlaylistSongs";
                var playlistSongs = connection.Query<PlaylistSongs>(query).ToList();
                return playlistSongs;
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

        public List<Songs> GetSongs()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT id, title, artistid, time FROM dbo.Songs";
                var songs = connection.Query<Songs>(query).ToList();
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
