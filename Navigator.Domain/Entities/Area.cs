using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class Area
    {
        public int Id { get; set; }

        [StringLength(10)]
        public string ShortName { get; set; }

        [StringLength(255)]
        public string FolderPath { get; set; }
    }
}
