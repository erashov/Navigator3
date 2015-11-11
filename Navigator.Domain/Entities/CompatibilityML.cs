using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class CompatibilityML
    {
        public int ID { get; set; }

        public int GroupID { get; set; }

        public int NumML { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string UserCreate { get; set; }

        public int? DeptID { get; set; }
    }
}
