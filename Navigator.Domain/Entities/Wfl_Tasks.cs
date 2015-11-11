using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Navigator.Domain.Entities
{
   public class Wfl_Tasks
    {
        public int Id { get; set; }

        public int NumML { get; set; }

        public int? ParentId { get; set; }

        [Required]
        [StringLength(50)]
        public string UserFrom { get; set; }

        public DateTime StartDate { get; set; }

        [StringLength(4000)]
        public string TaskComment { get; set; }

        [StringLength(32)]
        public string UserDo { get; set; }

        public DateTime? EndDate { get; set; }

        [StringLength(4000)]
        public string Report { get; set; }

        public int? TaskResult { get; set; }

        public DateTime? CancelDate { get; set; }

        [StringLength(32)]
        public string CancelUser { get; set; }

        [StringLength(4000)]
        public string CancelReason { get; set; }

        public int TaskType { get; set; }

        public int? ReturnReasonId { get; set; }

        [StringLength(32)]
        public string ReturnUser { get; set; }

        public DateTime? ReturnDate { get; set; }

        [StringLength(4000)]
        public string ReturnComment { get; set; }

        [StringLength(32)]
        public string GetTaskUser { get; set; }

        public DateTime? GetTaskDate { get; set; }

        public int? MainTaskForStep { get; set; }

        public int DepartmentIdTo { get; set; }

        public int DepartmentIdFrom { get; set; }


        public int MainTaskUniqueness { get; set; }
    }
}
