using System.Web.Mvc;
using Navigator.Domain.Abstract;
namespace Navigator.WebUI.Controllers
{
    public class RouteSheetController : Controller
    {
        private IRouteSheetRepository repository;
        public RouteSheetController(IRouteSheetRepository routesheetRepository)
        {
            this.repository = routesheetRepository;
        }
        // GET: RouteSheet
        public ViewResult List()
        {
            return View(repository.RouteSheets);
        }
    }
}