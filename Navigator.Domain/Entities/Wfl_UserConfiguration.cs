using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class Wfl_UserConfiguration
    {

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        public string FilterExpression { get; set; }

        [Required]
        [StringLength(50)]
        public string UserName { get; set; }

        public int Department { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreateDate { get; set; }

        [StringLength(1024)]
        public string Description { get; set; }

        public string Setting { get; set; }
    }
}
