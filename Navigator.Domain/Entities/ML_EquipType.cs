using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class ML_EquipType
    {
        public int ID { get; set; }

        public int NumML { get; set; }

        public int UnitId { get; set; }

        [StringLength(25)]
        public string Okonchanie { get; set; }

        [StringLength(255)]
        public string Equipment { get; set; }

        [StringLength(255)]
        public string SerialNum { get; set; }

        public int? Kol_vo { get; set; }

        public decimal? Cost { get; set; }

        public decimal? CostOne { get; set; }

        [StringLength(500)]
        public string Designation { get; set; }

        [StringLength(50)]
        public string State { get; set; }

        public int? SetupId { get; set; }

        [StringLength(255)]
        public string SetupValue { get; set; }
    }
}
