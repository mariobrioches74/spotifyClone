using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class PlaylistDetails
    {
        private List<Playlists> playlists;
        private List<Songs> songs;

        public List<Playlists> Playlists { get => playlists; set => playlists = value; }
        public List<Songs> Songs { get => songs; set => songs = value; }

        public PlaylistDetails(List<Playlists> playlists, List<Songs> songs)
        {
            Playlists = playlists;
            Songs = songs;
        }
    }
}
