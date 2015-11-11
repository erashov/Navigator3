using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class TL_Knots
    {
        [Key]
        [Column(Order = 0)]
        public int id { get; set; }

        [Key]
        [Column(Order = 1)]
        public int NumMl { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(25)]
        public string Okonchanie { get; set; }

        [StringLength(255)]
        public string Uzel_priv { get; set; }

        [StringLength(100)]
        public string Skorost_potoka { get; set; }

        [StringLength(255)]
        public string Uzel_naznach { get; set; }

        [StringLength(255)]
        public string Styk_porta { get; set; }

        [StringLength(100)]
        public string NumKanala { get; set; }

        [StringLength(255)]
        public string Abonent_Okonchanie { get; set; }

        [StringLength(100)]
        public string Marshrutizator { get; set; }

        [StringLength(255)]
        public string Transp_Uzel { get; set; }

        public string Oborud_Tel { get; set; }

        [StringLength(255)]
        public string Uzel_ATS { get; set; }

        [StringLength(128)]
        public string CodeBC { get; set; }

        [StringLength(255)]
        public string NumUslQ { get; set; }

        [StringLength(128)]
        public string NumVlan { get; set; }

        [StringLength(128)]
        public string OnAccessNode { get; set; }

        [StringLength(255)]
        public string Prim { get; set; }
    }
}
