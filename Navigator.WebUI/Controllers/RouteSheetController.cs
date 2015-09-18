using System.Web.Mvc;
using Navigator.Domain.Abstract;
namespace Navigator.WebUI.Controllers
{
    public class RouteSheetController : Controller
    {
        private IListMLGridRepository repository;
        public RouteSheetController(IListMLGridRepository routesheetRepository)
        {
            this.repository = routesheetRepository;
        }
        // GET: RouteSheet
        public ViewResult List()
        {
            return View(repository.ListMLGrids);
        }
    }
}