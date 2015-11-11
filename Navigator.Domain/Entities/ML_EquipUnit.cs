using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class ML_EquipUnit
    {
        [Key]
        public int UnitId { get; set; }

        [Required]
        [StringLength(100)]
        public string UnitName { get; set; }

        [StringLength(50)]
        public string UnitShortName { get; set; }
    }
}
