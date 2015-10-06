using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
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
        //   HttpRequest _request = HttpContext.Current.Request;

        public IQueryable<ListMLGrid> GetListMLGrids()
        {
           // int take = _request["take"]==null?10:int.Parse(_request["take"]);
            //int skip = _request["skip"] == null ? 0 : int.Parse(_request["skip"]);
            return _repository.ListMLGrids;//.Skip(skip).Take(take);//.qu.OrderByDescending(c=>c.NumML).AsQueryable();
        }
    }
}
