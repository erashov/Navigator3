using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class AttributeMLExtra
    {
        public int id { get; set; }

        public int NumML { get; set; }

        [StringLength(50)]
        public string AttrName { get; set; }

        [StringLength(255)]
        public string AttrFullName { get; set; }

        [StringLength(512)]
        public string AttrValue { get; set; }
    }
}
