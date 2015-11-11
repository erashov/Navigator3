using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class TL_Main
    {
        [Key]
        public int NumML { get; set; }

        [StringLength(50)]
        public string TaskName { get; set; }

        [StringLength(50)]
        public string ServiceName { get; set; }

        [StringLength(50)]
        public string BasisName { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }
    }
}
