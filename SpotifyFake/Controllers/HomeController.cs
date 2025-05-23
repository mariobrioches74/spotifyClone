using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using SpotifyFake.Models;
using SpotifyFake.ViewModels;
using SpotifyFake.Data; 

namespace SpotifyFake.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            List<Albums> albums = new List<Albums>();
            List<AlbumSongs> albumSongs = new List<AlbumSongs>();
            List<Artists> artists = new List<Artists>();
            List<MusicTypes> musicTypes = new List<MusicTypes>();
            List<Playlists> playlists = new List<Playlists>();
            List<PlaylistSongs> playlistSongs = new List<PlaylistSongs>();
            List<SongMusicTypes> songMusicTypes = new List<SongMusicTypes>();
            List<Songs> songs = new List<Songs>();
            List<Users> users = new List<Users>();

            DatabaseAccess data =  new  DatabaseAccess();
            albums = data.GetAlbums(null);
            albumSongs = data.GetAlbumSongs();
            artists = data.GetArtists();
            musicTypes = data.GetMusicTypes();
            playlists = data.GetPlaylists(null);
            playlistSongs = data.GetPSongs();
            songMusicTypes = data.GetSongMusicTypes();
            songs = data.GetSongs(null,null);
            users = data.GetUsers();

            return View(new IndexViewModel(albums, albumSongs, artists, musicTypes, playlists, playlistSongs, songMusicTypes, songs, users));
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult HomeViewRightMenu()
        {
            List<Albums> albums = new List<Albums>();
            List<AlbumSongs> albumSongs = new List<AlbumSongs>();
            List<Artists> artists = new List<Artists>();
            List<MusicTypes> musicTypes = new List<MusicTypes>();
            List<Playlists> playlists = new List<Playlists>();
            List<PlaylistSongs> playlistSongs = new List<PlaylistSongs>();
            List<SongMusicTypes> songMusicTypes = new List<SongMusicTypes>();
            List<Songs> songs = new List<Songs>();
            List<Users> users = new List<Users>();

            DatabaseAccess data = new DatabaseAccess();
            albums = data.GetAlbums(null);
            albumSongs = data.GetAlbumSongs();
            artists = data.GetArtists();
            musicTypes = data.GetMusicTypes();
            playlists = data.GetPlaylists(null);
            //playlistSongs = data.GetPlaylistSongs();
            songMusicTypes = data.GetSongMusicTypes();
            songs = data.GetSongs(null, null);
            users = data.GetUsers();

            return View(new HomeViewRightMenuViewModel(albums, albumSongs, artists, musicTypes, playlists, playlistSongs, songMusicTypes, songs, users));
        }

        public IActionResult PlaylistDetails(int playlistId)
        {
            List<Songs> songs = new List<Songs>();
            List<Playlists> playlist = new List<Playlists>();

            DatabaseAccess data = new DatabaseAccess();

            playlist = data.GetPlaylists(playlistId);
            songs = data.GetPlaylistSongs(playlistId);            

            return View(new PlaylistDetails(songs, playlist, playlistId));
        }

        public IActionResult AlbumDetails(int albumId)
        {
            List<Songs> songs = new List<Songs>();
            List<Albums> albums = new List<Albums>();
            DatabaseAccess data = new DatabaseAccess();

            albums = data.GetAlbums(null);
            songs = data.GetAlbumSongs(albumId);

            return View(new AlbumDetailsViewModel(songs, albums, albumId));
        }

        public IActionResult ArtistDetails(int artistId)
        {
            List<Songs> songs = new List<Songs>();
            List<Albums> albums = new List<Albums>();
            List<Artists> artist = new List<Artists>();
            DatabaseAccess data = new DatabaseAccess();

            albums = data.GetAlbums(artistId);
            artist = data.GetArtists();
            songs = data.GetArtistSongs(artistId);

            return View(new ArtistDetailsViewModel(songs, artist, albums, artistId));
        }
        public IActionResult SongDetails(int songId)
        {
            Songs song = new Songs();
            DatabaseAccess data = new DatabaseAccess();

            song = data.GetSongDetail(songId);

            return View(new SongDetail(song, songId));
        }
        public IActionResult GenreDetails(int typeId)
        {
            List<Songs> songs = new List<Songs>();
            List<MusicTypes> types = new List<MusicTypes>();
            DatabaseAccess data = new DatabaseAccess();

            types = data.GetMusicTypes();
            songs = data.GetGenreSongs(typeId);

            return View(new GenreDetailsViewModel(songs, types, typeId));
        }

        public IActionResult PopUpAddPlaylist()
        {
            var model = new PopUpAddPlaylistViewModel
            {
                newPlaylist = new Playlists()  
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult AddPlaylist(PopUpAddPlaylistViewModel model)
        {
            DatabaseAccess data = new DatabaseAccess();
            data.newPlaylist(model.newPlaylist);
            return RedirectToAction("Index"); 
        }

        public async Task<IActionResult> DeletePlaylist(int PlaylistId)
        {
            DatabaseAccess data = new DatabaseAccess();
            data.DeletePlaylist(PlaylistId);
            return RedirectToAction("Index");
        }

        public IActionResult AllSongs(int playlistId)
        {
            List<Songs> playlistsongs = new List<Songs>();
            List<Songs> songs = new List<Songs>();
            DatabaseAccess data = new DatabaseAccess();

            playlistsongs = data.GetSongs(playlistId, null);
            songs = data.GetSongs(null, null);
            return View(new AllSongsViewModel(songs, playlistId, playlistsongs));
        }

        public IActionResult AddSongsToPlaylist(int playlistId, int songId)
        {
            DatabaseAccess data = new DatabaseAccess();
            data.AddSongsToPlaylist(playlistId, songId);
            return RedirectToAction("HomeViewRightMenu");
        }

        public async Task<IActionResult> DeleteSongsFromPlaylist(int playlistId, int songId)
        {
            DatabaseAccess data = new DatabaseAccess();
            data.DeleteSongsFromPlaylist(playlistId, songId);
            return RedirectToAction("HomeViewRightMenu");
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
