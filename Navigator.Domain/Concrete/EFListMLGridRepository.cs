using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Collections.Generic;
using System.Linq;

namespace Navigator.Domain.Concrete
{
    public class EFListMLGridRepository : IListMLGridRepository
    {
        private EFDbContext context = new EFDbContext();
        public IQueryable<ListMLGrid> ListMLGrids
        {
            get
            {
                return context.ListMLGrids;
            }
        }
    }
}
