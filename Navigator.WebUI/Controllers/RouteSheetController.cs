using System.Web.Mvc;
using Navigator.Domain.Abstract;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System.Collections.Generic;
using Kendo.Mvc;
using System.Linq;

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
            DataSourceResult result = new DataSourceResult();
            //ModifyFilters(request.Filters, request);   
            var fil = request.Filters.FirstOrDefault(m => (m as FilterDescriptor).Member == "Adres");
            if (fil != null && (fil as FilterDescriptor).Value.ToString().Contains("*"))
            {
                (fil as FilterDescriptor).Value = string.Empty;// (fil as FilterDescriptor).Value.ToString().Split('*')[0];
                DataSourceRequest request1 = new DataSourceRequest();
                result = repository.ListMLGrids.ToDataSourceResult(request1);
                //var filt = new FilterDescriptor { Member = "Adres", Value = (fil as FilterDescriptor).Value.ToString().Split('*')[1], Operator = FilterOperator.Contains };
                //request.Filters.Add(filt);
            }
            else
            {
               result = repository.ListMLGrids.ToDataSourceResult(request);
            }

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
        private void ModifyFilters(IEnumerable<IFilterDescriptor> filters, DataSourceRequest request)
        {
            if (filters.Any())
            {
                foreach (var filter in filters)
                {
                    var descriptor = filter as FilterDescriptor;
                    if (descriptor != null && descriptor.Member == "AdresA")
                    {
                        var kendoDataRequest = new DataSourceRequest();
                        var filt = new FilterDescriptor { Member = "AdresB", Value = descriptor.Value };



                        request.Filters.Add(filt);
                    }
                    else if (filter is CompositeFilterDescriptor)
                    {

                    }
                }
            }
        }

    }
}