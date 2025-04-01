using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class SongDetail
    {
        Songs songs; 
        int songId;

        public SongDetail(Songs songs, int songId)
        {
            Songs = songs;
            SongId = songId;
        }

        public Songs Songs { get => songs; set => songs = value; }
        public int SongId { get => songId; set => songId = value; }
    }
}
