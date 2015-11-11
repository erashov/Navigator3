using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class ML_Equipment_Directory
    {
        public int UnitId { get; set; }

        [Required]
        [StringLength(500)]
        public string Equipment { get; set; }

        [StringLength(255)]
        public string SerialNum { get; set; }

        public decimal? CostOne { get; set; }

        [StringLength(255)]
        public string Designation { get; set; }

        public int Id { get; set; }
    }
}
