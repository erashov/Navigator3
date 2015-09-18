using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Ninject;
using System.Linq;
using Moq;
using Navigator.Domain.Entities;
using Navigator.Domain.Abstract;
using Navigator.Domain.Concrete;

namespace SportsStore.WebUI.Infrastructure
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

            //Mock<IRouteSheetRepository> mock = new Mock<IRouteSheetRepository>();
            //mock.Setup(m => m.List2Navs).Returns(
            //    new List<List2Nav> {
            //        new List2Nav { NumML = 400856, utverzh = DateTime.Now, Otvetstv = "Волкова Н.А.", Zakazhcik = "ООО \"КабЛук\"", AdresA = "Вавилова ул., д.53, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //        new List2Nav { NumML = 400857, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //            new List2Nav { NumML = 400858, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                new List2Nav { NumML = 400859, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                    new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                        new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                            new List2Nav { NumML = 400854, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                new List2Nav { NumML = 400853, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                    new List2Nav { NumML = 400852, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                        new List2Nav { NumML = 400851, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                            new List2Nav { NumML = 400850, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                                                new List2Nav { NumML = 400856, utverzh = DateTime.Now, Otvetstv = "Волкова Н.А.", Zakazhcik = "ООО \"КабЛук\"", AdresA = "Вавилова ул., д.53, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //        new List2Nav { NumML = 400857, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //            new List2Nav { NumML = 400858, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                new List2Nav { NumML = 400859, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                    new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                        new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                            new List2Nav { NumML = 400854, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                new List2Nav { NumML = 400853, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                    new List2Nav { NumML = 400852, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                        new List2Nav { NumML = 400851, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                            new List2Nav { NumML = 400850, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                                                new List2Nav { NumML = 400856, utverzh = DateTime.Now, Otvetstv = "Волкова Н.А.", Zakazhcik = "ООО \"КабЛук\"", AdresA = "Вавилова ул., д.53, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //        new List2Nav { NumML = 400857, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //            new List2Nav { NumML = 400858, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                new List2Nav { NumML = 400859, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                    new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                        new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                            new List2Nav { NumML = 400854, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                new List2Nav { NumML = 400853, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                    new List2Nav { NumML = 400852, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                        new List2Nav { NumML = 400851, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                            new List2Nav { NumML = 400850, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                                                new List2Nav { NumML = 400856, utverzh = DateTime.Now, Otvetstv = "Волкова Н.А.", Zakazhcik = "ООО \"КабЛук\"", AdresA = "Вавилова ул., д.53, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //        new List2Nav { NumML = 400857, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //            new List2Nav { NumML = 400858, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                new List2Nav { NumML = 400859, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                    new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                        new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                            new List2Nav { NumML = 400854, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                new List2Nav { NumML = 400853, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                    new List2Nav { NumML = 400852, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                        new List2Nav { NumML = 400851, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                            new List2Nav { NumML = 400850, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" }
            //                                            ,                    new List2Nav { NumML = 400856, utverzh = DateTime.Now, Otvetstv = "Волкова Н.А.", Zakazhcik = "ООО \"КабЛук\"", AdresA = "Вавилова ул., д.53, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //        new List2Nav { NumML = 400857, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //            new List2Nav { NumML = 400858, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                new List2Nav { NumML = 400859, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                    new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                        new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                            new List2Nav { NumML = 400854, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                new List2Nav { NumML = 400853, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                    new List2Nav { NumML = 400852, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                        new List2Nav { NumML = 400851, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                            new List2Nav { NumML = 400850, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                                                new List2Nav { NumML = 400856, utverzh = DateTime.Now, Otvetstv = "Волкова Н.А.", Zakazhcik = "ООО \"КабЛук\"", AdresA = "Вавилова ул., д.53, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //        new List2Nav { NumML = 400857, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //            new List2Nav { NumML = 400858, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                new List2Nav { NumML = 400859, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                    new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                        new List2Nav { NumML = 400855, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                            new List2Nav { NumML = 400854, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                new List2Nav { NumML = 400853, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                    new List2Nav { NumML = 400852, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                        new List2Nav { NumML = 400851, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" },
            //                                            new List2Nav { NumML = 400850, utverzh = DateTime.Now, Otvetstv = "Волова Н.В.", Zakazhcik = "ООО \"Лук\"", AdresA = "Вавилова ул., д.54, корп.1,1-й подъезд,, этаж 2, ком.213 (коридор)", AdresB = "" }
            //    });
            //kernel.Bind<IRouteSheetRepository>().ToConstant(mock.Object);

        }
    }
}