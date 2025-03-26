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
            List<MusicTypes> musicTypes = new List<MusicTypes>();
            DatabaseAccess data =  new  DatabaseAccess();
            musicTypes = data.GetMusicTypes();

            return View(new IndexViewModel(musicTypes));
        }

        public IActionResult Privacy()
        {
            return View();
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
