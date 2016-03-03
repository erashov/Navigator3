using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Navigator.Domain.Entities;
namespace Navigator.Domain.Abstract
{
   public interface IRouteProcedureRepository
    {
        IQueryable<RouteProcedure> GetUsers(string user, string searchUser);
    }
}
