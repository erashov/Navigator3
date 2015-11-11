using Navigator.Domain.Abstract;
using System.Linq;
using Navigator.Domain.Entities;

namespace Navigator.Domain.Concrete
{
    public class EFWfl_UserConfigurationRepository : IWfl_UserConfigurationRepository
    {
        private EFDbContext context = new EFDbContext();
        public IQueryable<Wfl_UserConfiguration> Wfl_UserConfigurations
        {
            get
            {
                return context.Wfl_UserConfigurations;
            }
        }
    }
}
