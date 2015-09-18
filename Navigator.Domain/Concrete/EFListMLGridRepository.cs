using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Navigator.Domain.Concrete
{
   public class EFListMLGridRepository : IListMLGridRepository
    {
        private EFDbContext context = new EFDbContext();
        public IEnumerable<ListMLGrid> ListMLGrids
        {
            get
            {
                return context.ListMLGrids;
            }
        }
    }
}
