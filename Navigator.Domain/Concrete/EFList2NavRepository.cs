using System.Linq;
using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;

namespace Navigator.Domain.Concrete
{
    public class EFList2NavRepository : IList2NavRepository
    {
        private EFDbContext context = new EFDbContext();
        public IQueryable<List2Nav> List2navs
        {
            get
            {
                return context.List2Navs;
            }
        }
    }
}
