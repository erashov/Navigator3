﻿using Navigator.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Navigator.Web.KendoGridUtilities
{
    public class KendoGridSorterCollection
    {
        public List<KendoGridSorter> Sorters { get; private set; }
        private KendoGridSorterCollection()
        {
            Sorters = new List<KendoGridSorter>();
        }

        public static KendoGridSorterCollection BuildEmptyCollection()
        {
            return new KendoGridSorterCollection();
        }

        public static KendoGridSorterCollection BuildCollection(HttpRequestBase request)
        {
            var collection = BuildEmptyCollection();

            var idex = 0;
            while (true)
            {
                var sorter = new KendoGridSorter()
                {
                    Field = request.Params["sort[" + idex + "][field]"],
                    Direction = request.Params["sort[" + idex + "][dir]"]
                };

                if (sorter.Field == null) { break; }
                collection.Sorters.Add(sorter);
                idex++;
            }

            return collection;
        }
    }

}