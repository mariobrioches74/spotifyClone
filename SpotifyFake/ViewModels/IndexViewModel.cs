using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class IndexViewModel
    {
        private List<Albums> albums;
        private List<AlbumSongs> albumsSongs;
        private List<Artists> artists;
        private List<MusicTypes> musicTypes;
        private List<Playlists> playlists;
        private List<PlaylistSongs> playlistSongs;
        private List<SongMusicTypes> songMusicTypes;
        private List<Songs> songs;
        private List<Users> users;

        public List<Albums> Albums { get => albums; set => albums = value; }
        public List<AlbumSongs> AlbumsSongs { get => albumsSongs; set => albumsSongs = value; }
        public List<Artists> Artists { get => artists; set => artists = value; }
        public List<MusicTypes> MusicTypes { get => musicTypes; set => musicTypes = value; }
        public List<Playlists> Playlists { get => playlists; set => playlists = value; }
        public List<PlaylistSongs> PlaylistSongs { get => playlistSongs; set => playlistSongs = value; }
        public List<SongMusicTypes> SongMusicTypes { get => songMusicTypes; set => songMusicTypes = value; }
        public List<Songs> Songs { get => songs; set => songs = value; }
        public List<Users> Users { get => users; set => users = value; }

        public IndexViewModel(List<Albums> albums, List<AlbumSongs> albumsSongs, List<Artists> artists, List<MusicTypes> musicTypes, List<Playlists> playlists, 
            List<PlaylistSongs> playlistSongs, List<SongMusicTypes> songMusicTypes, List<Songs> songs, List<Users> users)
        {
            Albums = albums;
            AlbumsSongs = albumsSongs;
            Artists = artists;
            MusicTypes = musicTypes;
            Playlists = playlists;
            PlaylistSongs = playlistSongs;
            SongMusicTypes = songMusicTypes;
            Songs = songs;
            Users = users;
        }

        public string DeletePlaylistCommandLink(int playlistId)
             => $"Home/DeletePlaylist?playlistId={playlistId}";
    }
}
