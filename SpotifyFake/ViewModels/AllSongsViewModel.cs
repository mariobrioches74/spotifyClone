using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class AllSongsViewModel
    {
        private List<Songs> songs;

        public List<Songs> Songs { get => songs; set => songs = value; }

        public AllSongsViewModel(List<Songs> songs)
        {
            Songs = songs;
        }
    }
}
