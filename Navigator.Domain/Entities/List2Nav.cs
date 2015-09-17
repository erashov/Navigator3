using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Navigator.Domain.Entities
{
    [Table("dbo.List2Nav")]
    public class List2Nav
    {
        [Key]
        public int NumML { get; set; }
        public DateTime? utverzh { get; set; }
        public string Otvetstv { get; set; }
        public string Zakazhcik { get; set; }
        public string AdresA { get; set; }
        public string AdresB { get; set; }
    }
}
