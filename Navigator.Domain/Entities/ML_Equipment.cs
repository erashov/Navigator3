using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class ML_Equipment
    {
        [Key]
        public int NumMl { get; set; }

        [StringLength(23)]
        public string Data_Organiz { get; set; }

        [StringLength(100)]
        public string Otvetstv_Organiz { get; set; }

        [StringLength(100)]
        public string Predst_Zakazchika { get; set; }

        [StringLength(23)]
        public string Inf_Data { get; set; }

        public decimal? Summa { get; set; }
    }
}
