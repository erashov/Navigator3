using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class ML_Editing
    {
        [Key]
        public int NumML { get; set; }

        public int? IsEditing { get; set; }

        [StringLength(255)]
        public string UserName { get; set; }
    }
}
