using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class ML_Lines
    {
        [Key]
        [Column(Order = 0)]
        public int NumMl { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(25)]
        public string Line_type { get; set; }

        [StringLength(255)]
        public string Adres_ULSS { get; set; }

        [StringLength(100)]
        public string Markirovka { get; set; }

        [StringLength(255)]
        public string Uzlovaya_stanc { get; set; }

        [StringLength(255)]
        public string BindingSite { get; set; }

        [StringLength(255)]
        public string TransitNode { get; set; }

        [StringLength(500)]
        public string Prim { get; set; }
    }
}
