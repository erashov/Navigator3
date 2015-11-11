using System.Linq;
using Navigator.Domain.Entities;

namespace Navigator.Domain.Abstract
{
    public interface IList2NavRepository
    {
        IQueryable<List2Nav> List2navs { get; }

    }
}
