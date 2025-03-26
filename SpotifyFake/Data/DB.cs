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

        public List<MusicTypes> GetMusicTypes()
        {
            using(var connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT id, type FROM dbo.MusicTypes";
                var musicTypes = connection.Query<MusicTypes>(query).ToList();
                return musicTypes;
            }
        }

    }
}
