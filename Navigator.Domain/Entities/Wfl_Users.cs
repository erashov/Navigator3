using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public  class Wfl_Users
    {
        [Required]
        [StringLength(32)]
        public string AdName { get; set; }

        public int? Dept { get; set; }

        [StringLength(50)]
        public string SurName { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Patronymic { get; set; }

        public int? DeptIdFromLotus { get; set; }

        public int id { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }
    }
}
