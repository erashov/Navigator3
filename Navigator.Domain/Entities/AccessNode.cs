using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    [Table("AccessNode")]
    public class AccessNode
    {
        public string organ { get; set; }
        public string adres { get; set; }
        public string sokr { get; set; }
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Код { get; set; }

        public Guid rowguid { get; set; }
    }
}
