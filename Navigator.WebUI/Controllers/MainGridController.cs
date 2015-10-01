using System.Web.Mvc;

namespace Navigator.WebUI.Controllers
{
    public class MainGridController : Controller
    {
        // GET: MainGrid
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Odata()
        {
            return View();
        }
    }
}