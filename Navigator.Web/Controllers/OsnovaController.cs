using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using Navigator.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web.Mvc;

namespace Navigator.Web.Controllers
{
    public class OsnovaController : Controller
    {
        private IOsnovaRepository _repository;
        public OsnovaController(IOsnovaRepository routesheetRepository)
        {
            this._repository = routesheetRepository;
        }
        // GET: Osnova
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetList(int page, int pageSize, int take,  List<GridSort> sort = null, GridFilters filter = null)
        {
            var osnovas = _repository.Osnovas.AsQueryable();
            var totalCount = _repository.Osnovas.Count();

            if (filter != null && (filter.Filters != null && filter.Filters.Count > 0))
            {
                string whereClause = null;
                var parameters = new List<object>();
                var filters = filter.Filters;

                for (var i = 0; i < filters.Count; i++)
                {
                    if (i == 0)
                        whereClause += string.Format(" {0}",
                            BuildWhereClause<Osnova>(i, filter.Logic, filters[i],
                            parameters));
                    else
                        whereClause += string.Format(" {0} {1}",
                            ToLinqOperator(filter.Logic),
                            BuildWhereClause<Osnova>(i, filter.Logic, filters[i],
                            parameters));
                }

                osnovas = osnovas.Where(whereClause, parameters.ToArray());
                totalCount = osnovas.Where(whereClause, parameters.ToArray()).Count();
            }

            if (sort != null && sort.Count > 0)
            {
                foreach (var s in sort)
                {
                  //  s.Field = (s.Field == "ProductType") ? "ProductTypeId" : s.Field;
                    osnovas = osnovas.OrderBy(s.Field + " " + s.Dir);
                }
            }
            else
            {
                osnovas = osnovas.OrderBy("NumML desc");
            }
            var data  = osnovas.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            var jsonData = new { total = totalCount, data=data };
            return Json(jsonData, JsonRequestBehavior.AllowGet);



        }
        public static string BuildWhereClause<T>(int index, string logic,
        GridFilter filter, List<object> parameters)
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
                    if (typeof(DateTime).IsAssignableFrom(property.PropertyType))
                    {
                        parameters.Add(DateTime.Parse(filter.Value).Date);
                        return string.Format("EntityFunctions.TruncateTime({0}){1}@{2}",
                            filter.Field,
                            ToLinqOperator(filter.Operator),
                            index);
                    }
                    if (typeof(int).IsAssignableFrom(property.PropertyType))
                    {
                        parameters.Add(int.Parse(filter.Value));
                        return string.Format("{0}{1}@{2}",
                            filter.Field,
                            ToLinqOperator(filter.Operator),
                            index);
                    }
                    parameters.Add(filter.Value);
                    return string.Format("{0}{1}@{2}",
                        filter.Field,
                        ToLinqOperator(filter.Operator),
                        index);
                case "startswith":
                    parameters.Add(filter.Value);
                    return string.Format("{0}.StartsWith(" + "@{1})",
                        filter.Field,
                        index);
                case "endswith":
                    parameters.Add(filter.Value);
                    return string.Format("{0}.EndsWith(" + "@{1})",
                        filter.Field,
                        index);
                case "contains":
                    parameters.Add(filter.Value);
                    return string.Format("{0}.Contains(" + "@{1})",
                        filter.Field,
                        index);
                default:
                    throw new ArgumentException(
                        "This operator is not yet supported for this Grid",
                        filter.Operator);
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