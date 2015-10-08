using System.Web.Http;

namespace Navigator.Web
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            //ODataConventionModelBuilder builder = new ODataConventionModelBuilder();
            //builder.EntitySet<ListMLGrid>("ListMLGrids");
            //config.Routes.MapODataServiceRoute("odata", "odata", builder.GetEdmModel());
        }
    }
}
