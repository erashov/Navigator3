using System.Web.Mvc;
using Navigator.Domain.Abstract;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

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
            return View();// repository.ListMLGrids);
        }

        public ActionResult RouteSheet_Read([DataSourceRequest]DataSourceRequest request)
        {
            DataSourceResult result = repository.ListMLGrids.ToDataSourceResult(request);
            return Json(result);
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IListMLGridRepository routesheetRepository)
        {
            if (routesheetRepository != null && ModelState.IsValid)
            {
                foreach (var product in routesheetRepository.ListMLGrids)
                {
                   // productService.Update(product);
                }
            }

            return Json(routesheetRepository.ListMLGrids.ToDataSourceResult(request, ModelState));
        }
    }
}