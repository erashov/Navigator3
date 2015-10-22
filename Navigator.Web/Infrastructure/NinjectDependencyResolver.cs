using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Ninject;
using Navigator.Domain.Abstract;
using Navigator.Domain.Concrete;

namespace Navigator.Web.Infrastructure
{
    public class NinjectDependencyResolver : IDependencyResolver
    {
        private IKernel kernel;
        public NinjectDependencyResolver(IKernel kernelParam)
        {
            kernel = kernelParam;
            AddBindings();
        }
        public object GetService(Type serviceType)
        {
            return kernel.TryGet(serviceType);
        }
        public IEnumerable<object> GetServices(Type serviceType)
        {
            return kernel.GetAll(serviceType);
        }
        private void AddBindings()
        {
            kernel.Bind<IListMLGridRepository>().To<EFListMLGridRepository>();
            kernel.Bind<IOsnovaRepository>().To<EFOsnovaRepository>();
            kernel.Bind<IRouteSheetsRepository>().To<EFRouteSheetsRepository>();

        }
    }
}