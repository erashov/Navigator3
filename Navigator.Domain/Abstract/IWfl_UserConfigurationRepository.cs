using Navigator.Domain.Entities;
using System.Linq;

namespace Navigator.Domain.Abstract
{
    public interface IWfl_UserConfigurationRepository
    {
        IQueryable<Wfl_UserConfiguration> Wfl_UserConfigurations { get; }
    }
}
