using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class HomeViewRightMenuViewModel
    {
        private List<Albums> albums;
        private List<Artists> artists;
        private List<Playlists> playlists;
        private List<Users> users;
        private List<AlbumSongs> albumSongs;
        private List<Songs> songs;

        public List<Albums> Albums { get => albums; set => albums = value; }
        public List<Artists> Artists { get => artists; set => artists = value; }
        public List<Playlists> Playlists { get => playlists; set => playlists = value; }
        public List<Users> Users { get => users; set => users = value; }
        public List<AlbumSongs> AlbumSongs { get => albumSongs; set => albumSongs = value; }
        public List<Songs> Songs { get => songs; set => songs = value; }

        public HomeViewRightMenuViewModel(List<Albums> albums, List<Artists> artists, List<Playlists> playlists,List<Users> users, List<AlbumSongs> albumSongs, List<Songs> songs)
        {
            Albums = albums;
            Artists = artists;
            Playlists = playlists;
            Users = users;
            AlbumSongs = albumSongs;
            Songs = songs;
        }
    }
}
