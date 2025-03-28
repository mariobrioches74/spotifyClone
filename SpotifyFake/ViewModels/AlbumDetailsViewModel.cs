using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class AlbumDetailsViewModel
    {
        private List<Songs> songs;
        private List<Albums> albums;
        private int albumId;

        public List<Songs> Songs { get => songs; set => songs = value; }
        public List<Albums> Albums { get => albums; set => albums = value; }
        public int AlbumId { get => albumId; set => albumId = value; }

        public AlbumDetailsViewModel(List<Songs> songs, List<Albums> albums, int albumId)
        {
            Songs = songs;
            Albums = albums;
            AlbumId = albumId;
        }
    }
}
