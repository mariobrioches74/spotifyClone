using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class PlaylistDetails
    {
        private List<Songs> songs;
        private List<Playlists> playlists;
        private int playlistId;

        public List<Songs> Songs { get => songs; set => songs = value; }
        public List<Playlists> Playlists { get => playlists; set => playlists = value; }
        public int PlaylistId { get => playlistId; set => playlistId = value; }

        public PlaylistDetails(List<Songs> songs, List<Playlists> playlists, int playlistId)
        {
            Songs = songs;
            Playlists = playlists;
            PlaylistId = playlistId;
        }
    }
}
