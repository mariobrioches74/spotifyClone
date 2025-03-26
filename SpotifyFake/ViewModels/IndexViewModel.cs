using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class IndexViewModel
    {
        public List<MusicTypes> musicTypes { get; set; }

        public IndexViewModel(List<MusicTypes> MusicTypes) {
            musicTypes = MusicTypes;
        }
    }
}
