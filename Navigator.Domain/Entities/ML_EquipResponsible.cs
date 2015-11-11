using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class ML_EquipResponsible
    {
        [Key]
        [Column(Order = 0)]
        public int NumML { get; set; }

        [Key]
        [Column(Order = 1)]
        public int UnitId { get; set; }

        [StringLength(255)]
        public string Responsible { get; set; }

        [StringLength(255)]
        public string Kanal_priv { get; set; }

        [StringLength(23)]
        public string Data_poluch { get; set; }

        [StringLength(23)]
        public string Data_vypoln { get; set; }
    }
}
