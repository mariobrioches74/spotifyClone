using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class PlaylistDetails
    {
        private List<Songs> songs;

        public List<Songs> Songs { get => songs; set => songs = value; }

        public PlaylistDetails(List<Songs> songs)
        {
            Songs = songs;
        }
    }
}
