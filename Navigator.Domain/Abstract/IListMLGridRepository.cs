using Navigator.Domain.Entities;
using System.Collections.Generic;
using System.Linq;

namespace Navigator.Domain.Abstract
{
    public interface IListMLGridRepository
    {
        IQueryable<ListMLGrid> ListMLGrids { get; } 
    }
}
