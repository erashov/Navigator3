using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.OData;
//using System.Web.OData.Routing;

namespace Navigator.WebUI.Controllers
{
   // [ODataRoutePrefix("ListMLGrids")]
    public class ListMLGridsController:ODataController
    {
        private IListMLGridRepository _repository;
        public ListMLGridsController(IListMLGridRepository routesheetRepository)
        {
            this._repository = routesheetRepository;
        }
       // [EnableQuery]
        public IQueryable<ListMLGrid> Get()
        {
            return _repository.ListMLGrids;
        }
    }
}