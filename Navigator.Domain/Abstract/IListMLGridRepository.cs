using Navigator.Domain.Entities;
using System.Collections.Generic;

namespace Navigator.Domain.Abstract
{
    public interface IListMLGridRepository
    {
      IEnumerable<ListMLGrid> ListMLGrids { get; } 
    }
}
