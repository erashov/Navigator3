using Navigator.Domain.Concrete;
using Navigator.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Navigator.Domain.Abstract
{
   public interface IListMLGridRepository
    {
        IEnumerable<ListMLGrid> ListMLGrids { get; }
    }
}
