using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Navigator.WebUI.Controllers
{
    public class GridController : ApiController
    {
        private IListMLGridRepository _repository;
        public GridController(IListMLGridRepository routesheetRepository)
        {
            this._repository = routesheetRepository;
        }
        public IQueryable<ListMLGrid> GetListMLGrids()
        {
            return _repository.ListMLGrids.AsQueryable();
        }
    }
}
