using Navigator.Domain.Entities;
using System.Data.Entity;

namespace Navigator.Domain.Concrete
{
    public class EFDbContext: DbContext
    {
        public DbSet<ListMLGrid> ListMLGrids { get; set; }
    }
}
