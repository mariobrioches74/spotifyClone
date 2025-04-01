using SpotifyFake.Models;

namespace SpotifyFake.ViewModels
{
    public class PlaylistDetails
    {
        private List<Songs> songs;
        private List<Playlists> playlist;
        private int playlistId;

        public List<Songs> Songs { get => songs; set => songs = value; }
        public int PlaylistId { get => playlistId; set => playlistId = value; }
        public List<Playlists> Playlist { get => playlist; set => playlist = value; }

        public PlaylistDetails(List<Songs> songs, List<Playlists> playlist, int playlistId)
        {
            Songs = songs;
            Playlist = playlist;
            PlaylistId = playlistId;
        }
    }
}
