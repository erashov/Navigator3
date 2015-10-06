using Navigator.Domain.Entities;
using Newtonsoft.Json.Serialization;
using System.Web.Http;


namespace Navigator.WebUI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //ODataModelBuilder builder = new ODataConventionModelBuilder();
            //builder.EntitySet<ListMLGrid>("ListMLGrids");
            //config.MapODataServiceRoute(
            //    routeName: "ODataRoute",
            //    routePrefix: null,
            //    model: builder.GetEdmModel());

            //var settings = config.Formatters.JsonFormatter.SerializerSettings;
            //settings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            config.MapHttpAttributeRoutes();
            config.Formatters.Remove(config.Formatters.XmlFormatter);
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
