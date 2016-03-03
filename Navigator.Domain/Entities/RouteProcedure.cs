using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class RouteProcedure
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int NumML { get; set; }
        [StringLength(152)]
        public string FullUserName { get; set; }

        [StringLength(50)]
        public string Login { get; set; }


    }
}
