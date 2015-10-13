using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Linq;

namespace Navigator.Domain.Concrete
{
    public class EFOsnovaRepository : IOsnovaRepository
    {
        private EFDbContext context = new EFDbContext();
        public IQueryable<Osnova> Osnovas
        {
            get
            {
                return context.Osnovas;
            }
        }
    }
}
