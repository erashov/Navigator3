using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using Navigator.Domain.Abstract;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Navigator.WebUI.Controllers
{
    public class MainGridController : Controller
    {
        private IListMLGridRepository repository;
        public MainGridController(IListMLGridRepository routesheetRepository)
        {
            this.repository = routesheetRepository;
        }
        // GET: MainGrid
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Odata()
        {
            return View();
        }

        public async Task<DataSourceResult> Read([DataSourceRequest] DataSourceRequest request)
        {
            // Here you might actually get the items from your cache or database. 


            // Here is when the kendo magic happens. 
            return repository.ListMLGrids.ToDataSourceResult(request);
        }
    }
}