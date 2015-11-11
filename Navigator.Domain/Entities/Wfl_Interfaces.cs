using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class Wfl_Interfaces
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string ADName { get; set; }

        [Required]
        [StringLength(150)]
        public string InterfacePath { get; set; }

        public int? ISadmin { get; set; }

        [StringLength(50)]
        public string InterfaceName { get; set; }
    }
}
