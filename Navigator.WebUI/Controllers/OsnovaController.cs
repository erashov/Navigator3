using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using Navigator.Domain.Abstract;
using System.Web.Mvc;

namespace Navigator.WebUI.Controllers
{
    public class OsnovaController : Controller
    {
        private IOsnovaRepository repository;
        public OsnovaController(IOsnovaRepository routesheetRepository)
        {
            this.repository = routesheetRepository;
        }
        // GET: RouteSheet
        public ViewResult List()
        {
            return View();// repository.ListMLGrids);
        }

        public ActionResult Osnova_Read([DataSourceRequest]DataSourceRequest request)
        {
            DataSourceResult result = repository.Osnovas.ToDataSourceResult(request);
            return Json(result);
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IOsnovaRepository routesheetRepository)
        {
            if (routesheetRepository != null && ModelState.IsValid)
            {
                foreach (var product in routesheetRepository.Osnovas)
                {
                    // productService.Update(product);
                }
            }

            return Json(routesheetRepository.Osnovas.ToDataSourceResult(request, ModelState));
        }
    }
}