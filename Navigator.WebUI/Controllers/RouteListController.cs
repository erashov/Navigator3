using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.OData;

namespace Navigator.WebUI.Controllers
{
    public class RouteListController : ApiController
    {
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

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}