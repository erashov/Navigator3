using Navigator.Domain.Concrete;
using System.Data.Entity;
using System.Web.Http;

namespace Navigator.WebAPI
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
            Database.SetInitializer<EFDbContext>(null);
        }
    }
}
