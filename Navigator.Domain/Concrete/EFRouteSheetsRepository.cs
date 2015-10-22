using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Linq;

namespace Navigator.Domain.Concrete
{

    public class EFRouteSheetsRepository : IRouteSheetsRepository
    {
        private EFDbContext context = new EFDbContext();
        public IQueryable<RouteSheet> RouteSheets
        {
            get
            {
                return context.RouteSheets;
            }
        }
    }

}
