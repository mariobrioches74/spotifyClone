using SpotifyFake.Models;
namespace SpotifyFake.ViewModels
{
    public class ArtistDetailsViewModel
    {
        private List<Albums> albums;
        private List<Songs> songs;
        private List<Artists> artists;
        private int artistId;

        public ArtistDetailsViewModel(List<Songs> songs, List<Artists> artists, List<Albums> albums, int artistId)
        {
            Songs = songs;
            Artists = artists;
            ArtistId = artistId;
            Albums = albums;
        }

        public List<Songs> Songs { get => songs; set => songs = value; }
        public List<Artists> Artists { get => artists; set => artists = value; }
        public int ArtistId { get => artistId; set => artistId = value; }
        public List<Albums> Albums { get => albums; set => albums = value; }
    }
}
