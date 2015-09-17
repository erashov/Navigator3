using System;

namespace Navigator.Domain.Entities
{
    public class RouteSheet
    {
        public int NumML { get; set; }
        public DateTime? utverzh { get; set; }
        public string Otvetstv { get; set; }
        public string Zakazhcik { get; set; }
        public string AdresA { get; set; }
        public string AdresB { get; set; }
    }
}
