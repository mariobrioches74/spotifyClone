using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class GenreDetailsViewModel
    {
        private List<Songs> songs;
        private List<MusicTypes> musicTypes;
        private int typeId;

        public GenreDetailsViewModel(List<Songs> songs, List<MusicTypes> musicTypes, int typeId)
        {
            Songs = songs;
            MusicTypes = musicTypes;
            TypeId = typeId;
        }

        public List<Songs> Songs { get => songs; set => songs = value; }
        public List<MusicTypes> MusicTypes { get => musicTypes; set => musicTypes = value; }
        public int TypeId { get => typeId; set => typeId = value; }
    }
}
