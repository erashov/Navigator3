using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;
using System.Collections.Generic;
using System;

namespace Navigator.Domain.Concrete
{
    public class EFOsnovaRepository : IOsnovaRepository
    {
        private EFDbContext context = new EFDbContext();
        public IEnumerable<Osnova> Osnovas
        {
            get
            {
                return context.Osnovas;
            }
        }
    }
}
