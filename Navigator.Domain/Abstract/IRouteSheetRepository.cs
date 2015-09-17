using System.Collections.Generic;
using Navigator.Domain.Entities;

namespace Navigator.Domain.Abstract
{
    public interface IRouteSheetRepository
    {
        IEnumerable<List2Nav> List2Navs { get; }
    }
}
