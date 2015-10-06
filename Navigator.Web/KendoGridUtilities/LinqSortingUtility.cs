using Navigator.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Navigator.Web.KendoGridUtilities
{
    public static class LinqSortingUtility
    {
        public static IQueryable<T> MultipleSort<T>(this IQueryable<T> data,
            List<KendoGridSorter> sortExpressions)
        {
            if ((sortExpressions == null) || (sortExpressions.Count <= 0))
            {
                return data;
            }

            IQueryable<T> query = from item in data select item;
            IOrderedEnumerable<T> orderedQuery = null;

            for (int i = 0; i < sortExpressions.Count; i++)
            {
                var index = i;
                Func<T, object> expression = item => item.GetType()
                                .GetProperty(sortExpressions[index].Field)
                                .GetValue(item, null);

                if (sortExpressions[index].Direction == "asc")
                {
                    orderedQuery = (index == 0)
                        ? query.OrderBy(expression)
                            : orderedQuery.ThenBy(expression);
                }
                else
                {
                    orderedQuery = (index == 0)
                        ? query.OrderByDescending(expression)
                            : orderedQuery.ThenByDescending(expression);
                }
            }

            query = orderedQuery.AsQueryable();

            return query;
        }
    }
}