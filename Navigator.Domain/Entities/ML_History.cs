using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class ML_History
    {
        public decimal ID { get; set; }

        public int NumML { get; set; }

        public int Step { get; set; }

        public DateTime StartTime { get; set; }

        public DateTime? EndTime { get; set; }

        [StringLength(2048)]
        public string Comment { get; set; }

        [StringLength(100)]
        public string userName { get; set; }

        public int? stepID_link { get; set; }

        [StringLength(32)]
        public string department { get; set; }

        public int? NetTerm_num { get; set; }

        public int? canceled { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] timestamp { get; set; }

        public string Commentary { get; set; }
    }
}
