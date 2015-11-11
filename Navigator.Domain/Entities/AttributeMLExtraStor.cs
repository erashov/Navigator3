using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class AttributeMLExtraStor
    {
        public int Id { get; set; }

        public int Numml { get; set; }

        [StringLength(255)]
        public string Attribute { get; set; }

        public string Value { get; set; }
    }
}
