using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class ML_Notices
    {
        public int ID { get; set; }

        public int NumML { get; set; }

        [StringLength(50)]
        public string NumMLOV { get; set; }

        [StringLength(50)]
        public string UzelOV { get; set; }

        [StringLength(50)]
        public string NumOV { get; set; }

        [StringLength(255)]
        public string AdresOV { get; set; }

        [StringLength(255)]
        public string ZakazchikOV { get; set; }

        [StringLength(100)]
        public string NumUsl { get; set; }
    }
}
