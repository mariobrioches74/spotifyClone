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
            musicTypes = data.GetMusicTypes();

            return View(new IndexViewModel(albums, albumSongs, artists, musicTypes, playlists, playlistSongs, songMusicTypes, songs, users));
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult HomeViewRightMenu()
        {
            List<MusicTypes> musicTypes = new List<MusicTypes>();
            DatabaseAccess data = new DatabaseAccess();
            musicTypes = data.GetMusicTypes();
            return View(new IndexViewModel(musicTypes));
        }

        public IActionResult PlaylistDetails()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
