using Navigator.Domain.Entities;
using System.Linq;

namespace Navigator.Domain.Abstract
{
    public interface IAccessNodeRepository
    {
        IQueryable<AccessNode> AccessNodes { get; }
    }
}
