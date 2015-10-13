using Kendo.Mvc.Extensions;
using Navigator.Domain.Abstract;
using Navigator.Web.KendoGridUtilities;
using System.Linq;
using System.Web.Mvc;

namespace Navigator.Web.Controllers
{
    public class ListMLsController : Controller
    {
        private IListMLGridRepository _repository;
        public ListMLsController(IListMLGridRepository routesheetRepository)
        {
            this._repository = routesheetRepository;
        }
        // GET: ListMLs
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetListMls(int page, int pageSize, int take)
        {
            var sorterCollection = KendoGridSorterCollection.BuildCollection(Request);
            var filterCollection = KendoGridFilterCollection.BuildCollection(Request);
            var filteredMls = _repository.ListMLGrids.MultipleFilter(filterCollection.Filters);
            var sortedMls = filteredMls;
            if (sorterCollection.Sorters.Count() == 0)
            {
                sortedMls = filteredMls.OrderByDescending(v => v.NumML);
            }
            else
            {
                sortedMls = filteredMls.MultipleSort(sorterCollection.Sorters);
            }
            var count = sortedMls.Count();
          //  var data = sortedMls.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            var data = (from v in sortedMls.Skip((page - 1) * pageSize)
                            .Take(pageSize)
                        select v).ToList();
            var jsonData = new { total = count, data };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }
    }

}