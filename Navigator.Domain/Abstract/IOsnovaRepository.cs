using Navigator.Domain.Entities;
using System.Linq;

namespace Navigator.Domain.Abstract
{
    public interface IOsnovaRepository
    {
        IQueryable<Osnova> Osnovas { get; }
    }
}
