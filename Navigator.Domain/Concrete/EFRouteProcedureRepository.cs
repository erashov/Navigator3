using System;
using System.Linq;
using Navigator.Domain.Abstract;
using Navigator.Domain.Entities;

namespace Navigator.Domain.Concrete
{
    public class EFRouteProcedureRepository : IRouteProcedureRepository
    {
        private EFDbContext context = new EFDbContext();


        public IQueryable<RouteProcedure> GetUsers(string user, string searchUser)
        {
            return context.Database.SqlQuery<RouteProcedure>("[dbo].[GetRoutesheetsForUserName] @UserName={0}, @SearchUserName={1}", user,searchUser).AsQueryable();
        }
    }
}
