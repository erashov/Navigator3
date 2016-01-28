using Navigator.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Navigator.Web.Controllers
{
    public class AccessNodeController : Controller
    {
        private IAccessNodeRepository _repository;
        public AccessNodeController(IAccessNodeRepository AccessNodeRepository)
        {
            this._repository = AccessNodeRepository;
        }
        // GET: AccessNode
        public JsonResult GetAccessNode()
        {
            var jsonData = new { dataAN = _repository.AccessNodes.Where(d=>d.adres!=null).Select(d=>new { text= d.adres, adres = d.adres, sokr=d.sokr==null? "":d.sokr, organ = d.organ}).ToList() };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }
    }
}