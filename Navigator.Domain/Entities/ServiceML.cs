using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class ServiceML
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int? TheServiceId { get; set; }

        public int? NavigatorId { get; set; }

        [Key]
        [Column(Order = 1)]

        public int NumML { get; set; }

        [StringLength(50)]
        public string sCode { get; set; }

        [StringLength(50)]
        public string NumServ { get; set; }

        [StringLength(100)]
        public string SpecobA { get; set; }

        [StringLength(100)]
        public string SpecobB { get; set; }

        [StringLength(100)]
        public string NumChA { get; set; }

        [StringLength(100)]
        public string NumChB { get; set; }

        [Key]
        [Column(Order = 2)]
  
        public int TopML { get; set; }

        [StringLength(10)]
        public string sCode_aServ { get; set; }

        [StringLength(4000)]
        public string AddressA { get; set; }

        [StringLength(4000)]
        public string AddressB { get; set; }
    }
}
