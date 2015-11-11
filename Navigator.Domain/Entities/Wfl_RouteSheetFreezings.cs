using System;
using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class Wfl_RouteSheetFreezings
    {
        public int Id { get; set; }

        public int RSNumber { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime? StopDate { get; set; }

        public int? FreezeDepartmentId { get; set; }

        public int? UnfreezeDepartmentId { get; set; }

        public int? FreezeReason { get; set; }

        public string Comment { get; set; }

        [StringLength(50)]
        public string FreezeUser { get; set; }

        [StringLength(50)]
        public string UnfreezeUser { get; set; }

        public int? TaskId { get; set; }

        public string CommentUnfreezing { get; set; }
    }
}
