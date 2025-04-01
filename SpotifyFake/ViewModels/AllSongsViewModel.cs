using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class AllSongsViewModel
    {
        private List<Songs> playlistsongs;
        private List<Songs> songs;
        private int playlistId;

        public List<Songs> Songs { get => songs; set => songs = value; }
        public int PlaylistId { get => playlistId; set => playlistId = value; }
        public List<Songs> Playlistsongs { get => playlistsongs; set => playlistsongs = value; }

        public AllSongsViewModel(List<Songs> songs, int playlistId, List<Songs> playlistsongs)
        {
            Songs = songs;
            PlaylistId = playlistId;
            Playlistsongs = playlistsongs;
        }
        public string AddSongToPlaylistCommandLink(int playlistId, int songId)
            => $"Home/AddSongsToPlaylist?playlistId={playlistId}&songId={songId}";
    }
}
