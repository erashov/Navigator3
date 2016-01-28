using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Linq;

namespace Navigator.Domain.Concrete
{
    public  class EFDbAccessNodeRepository:IAccessNodeRepository
    {
        private EFDbContext context = new EFDbContext();
        public IQueryable<AccessNode> AccessNodes
        {
            get
            {
                return context.AccessNodes;
            }
        }
    }
}
