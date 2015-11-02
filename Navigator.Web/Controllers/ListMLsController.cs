using Kendo.Mvc.Extensions;
using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using Navigator.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web.Mvc;
using System.Data;
namespace Navigator.Web.Controllers
{
    public class ListMLsController : Controller
    {
        private IRouteSheetsRepository _repository;
        public ListMLsController(IRouteSheetsRepository routesheetRepository)
        {
            this._repository = routesheetRepository;
        }
        // GET: ListMLs
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetListMls(int page, int pageSize, int take, List<GridSort> sort = null, GridFilters filter = null)
        {
            try
            {
                var mls = _repository.RouteSheets.AsQueryable();
                var totalCount = _repository.RouteSheets.Count();
                if (filter != null && (filter.Filters != null && filter.Filters.Count > 0))
                {
                    string whereClause = null;
                    var parameters = new List<object>();
                    var filters = filter.Filters;
                    for (var i = 0; i < filters.Count; i++)
                    {
                        if (i == 0)
                            whereClause += string.Format(" {0}", BuildWhereClause<ListMLGrid>(i, filter.Logic, filters[i], parameters));
                        else
                            whereClause += string.Format(" {0} {1}", ToLinqOperator(filter.Logic), BuildWhereClause<ListMLGrid>(i, filter.Logic, filters[i], parameters));
                    }
                    mls = mls.Where(whereClause, parameters.ToArray());
                    totalCount = mls.Where(whereClause, parameters.ToArray()).Count();
                }

                if (sort != null && sort.Count > 0)
                {
                    foreach (var s in sort)
                    {
                        mls = mls.OrderBy(s.Field + " " + s.Dir);
                    }
                }
                else
                {
                    mls = mls.OrderBy("NumML desc");
                }
                var data = mls.Skip((page - 1) * pageSize).Take(pageSize).ToList();
                var jsonData = new { total = totalCount, data = data };
                return Json(jsonData, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                //string s = e.InnerException.Message;
                return Json(null, JsonRequestBehavior.AllowGet);
            }
        }
        public static string BuildWhereClause<T>(int index, string logic, GridFilter filter, List<object> parameters)
        {
            var entityType = (typeof(T));
            var property = entityType.GetProperty(filter.Field);

            switch (filter.Operator.ToLower())
            {
                case "eq":
                case "neq":
                case "gte":
                case "gt":
                case "lte":
                case "lt":
                    if (filter.Field == "oshugpz_start" || filter.Field == "oshugpz_end")
                    {
                        parameters.Add(DateTime.Parse(filter.Value).Date);
                        return string.Format("{0}{1}@{2}", filter.Field, ToLinqOperator(filter.Operator), index);
                    }
                    if (filter.Field == "NumML" || filter.Field == "dmv_ReportExist" || filter.Field == "gplr_ReportExist" || filter.Field == "oshugpz_ReportExist" ||
                        filter.Field == "otsod_ReportExist" || filter.Field == "osp_ReportExist" || filter.Field == "otse_ReportExist" || filter.Field == "otss_ReportExist" || filter.Field == "ushugpu_ReportExist"
                        || filter.Field == "otvu_ReportExist" || filter.Field == "otu_ReportExist" || filter.Field == "to_ReportExist")
                    {
                        parameters.Add(int.Parse(filter.Value));
                        return string.Format("{0}{1}@{2}", filter.Field, ToLinqOperator(filter.Operator), index);
                    }
                    parameters.Add(filter.Value);
                    return string.Format("{0}{1}@{2}", filter.Field, ToLinqOperator(filter.Operator), index);
                case "startswith":
                    parameters.Add(filter.Value);
                    return string.Format("{0}.StartsWith(" + "@{1})", filter.Field, index);
                case "endswith":
                    parameters.Add(filter.Value);
                    return string.Format("{0}.EndsWith(" + "@{1})", filter.Field, index);
                case "contains":
                    parameters.Add(filter.Value);
                    return string.Format("{0}.Contains(" + "@{1})", filter.Field, index);
                default:
                    throw new ArgumentException("This operator is not yet supported for this Grid", filter.Operator);
            }
        }

        public static string ToLinqOperator(string @operator)
        {
            switch (@operator.ToLower())
            {
                case "eq": return " == ";
                case "neq": return " != ";
                case "gte": return " >= ";
                case "gt": return " > ";
                case "lte": return " <= ";
                case "lt": return " < ";
                case "or": return " || ";
                case "and": return " && ";
                default: return null;
            }
        }
    }
}