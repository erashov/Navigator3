using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.OData;

namespace Navigator.WebAPI.Controllers
{
    public class RouteListController : ApiController
    {
        // GET api/<controller>
        private IListMLGridRepository _repository;
        public RouteListController(IListMLGridRepository routesheetRepository)
        {
            this._repository = routesheetRepository;
        }
        // GET api/<controller>

        public IQueryable<ListMLGrid> Get()
        {
            return _repository.ListMLGrids;
        }
    }
}