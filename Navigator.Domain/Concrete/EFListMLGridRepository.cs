using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Collections.Generic;
using System;
using System.Linq;

namespace Navigator.Domain.Concrete
{
    public class EFListMLGridRepository:IRouteSheetRepository
    {
        private EFDbContext context = new EFDbContext();


        public IEnumerable<List2Nav> List2Navs
        {
            get
            {
                return context.List2Navs;
            }
        }
    }
}
