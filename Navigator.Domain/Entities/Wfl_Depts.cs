using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class Wfl_Depts
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string DeptName { get; set; }

        [StringLength(50)]
        public string DeptInt { get; set; }

        public int? TaskType { get; set; }

        public int? ParentDept { get; set; }

        public bool? CanBeRouteSheetResponsible { get; set; }

        [StringLength(32)]
        public string LotusDocId { get; set; }

        public string RouteSheetListConfiguration { get; set; }
    }
}
