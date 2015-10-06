//using Kendo.Mvc;
//using Kendo.Mvc.Extensions;
//using Kendo.Mvc.UI;
//using Navigator.Domain.Abstract;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Threading.Tasks;
//using System.Web;
//using System.Web.Mvc;

//namespace Navigator.Web.Controllers
//{
//    public class RouteSheetController : Controller
//    {
//        private IListMLGridRepository repository;
//        public RouteSheetController(IListMLGridRepository routesheetRepository)
//        {
//            this.repository = routesheetRepository;
//        }
//        // GET: RouteSheet
//        public ViewResult List()
//        {
//            return View();// repository.ListMLGrids);
//        }

//        public ActionResult RouteSheet_Read([DataSourceRequest]DataSourceRequest request)
//        {
//            //ModifyFilters(request.Filters, request);   
//            //var fil = request.GroupsFilters.FirstOrDefault(m => (m as FilterDescriptor).Member == "AdresA");
//            //if (fil!=null) {
//            //    var filt = new FilterDescriptor { Member = "AdresB", Value = (fil as FilterDescriptor).Value, Operator= (fil as FilterDescriptor).Operator };
//            //    request.Filters.Add(filt);
//            //}
//            DataSourceResult result = repository.ListMLGrids.ToDataSourceResult(request);

//            return Json(result);
//        }
//        public async Task<DataSourceResult> Read([DataSourceRequest] DataSourceRequest request)
//        {
//            // Here you might actually get the items from your cache or database. 


//            // Here is when the kendo magic happens. 
//            return repository.ListMLGrids.ToDataSourceResult(request);
//        }

//        [AcceptVerbs(HttpVerbs.Post)]
//        public ActionResult Editing_Update([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IListMLGridRepository routesheetRepository)
//        {
//            if (routesheetRepository != null && ModelState.IsValid)
//            {
//                foreach (var product in routesheetRepository.ListMLGrids)
//                {
//                    // productService.Update(product);
//                }
//            }

//            return Json(routesheetRepository.ListMLGrids.ToDataSourceResult(request, ModelState));
//        }
//        private void ModifyFilters(IEnumerable<IFilterDescriptor> filters, DataSourceRequest request)
//        {
//            if (filters.Any())
//            {
//                foreach (var filter in filters)
//                {
//                    var descriptor = filter as FilterDescriptor;
//                    if (descriptor != null && descriptor.Member == "AdresA")
//                    {
//                        var kendoDataRequest = new DataSourceRequest();
//                        var filt = new FilterDescriptor { Member = "AdresB", Value = descriptor.Value };



//                        request.Filters.Add(filt);
//                    }
//                    else if (filter is CompositeFilterDescriptor)
//                    {

//                    }
//                }
//            }
//        }

//    }
//}