using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class Wfl_TaskInWork
    {
        [Key]
        public int NumML { get; set; }

        [Required]
        [StringLength(50)]
        public string Login { get; set; }

        [StringLength(50)]
        public string attribute { get; set; }
    }
}
