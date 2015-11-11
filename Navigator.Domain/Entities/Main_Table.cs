using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    class Main_Table
    {
        [Key]
        [StringLength(50)]
        public string NomerKanala { get; set; }

        [StringLength(50)]
        public string NoML_Vkl { get; set; }

        [StringLength(255)]
        public string Zakazchik { get; set; }

        [StringLength(255)]
        public string AdresA { get; set; }

        [StringLength(255)]
        public string AdresB { get; set; }

        [StringLength(50)]
        public string D_puska { get; set; }

        [StringLength(50)]
        public string D_otkl { get; set; }

        [StringLength(25)]
        public string NoML_Vykl { get; set; }

        [StringLength(255)]
        public string PrivA { get; set; }

        [StringLength(255)]
        public string PrivB { get; set; }

        [StringLength(50)]
        public string NameLink { get; set; }

        public int? NoKanE { get; set; }

        public float? Skorost { get; set; }

        [StringLength(255)]
        public string Prim { get; set; }

        public int? NoKanS { get; set; }

        public int? NoKanF { get; set; }

        public int? NoKanT { get; set; }

        public int? NoKanY { get; set; }

        public int? NoKanK { get; set; }

        [StringLength(150)]
        public string Vid { get; set; }

        [Column(TypeName = "ntext")]
        public string Kont1 { get; set; }

        [Column(TypeName = "ntext")]
        public string Kont2 { get; set; }

        [StringLength(50)]
        public string Port { get; set; }

        [StringLength(50)]
        public string Status_Kanala { get; set; }

        [StringLength(50)]
        public string Status_zakaz { get; set; }

        [StringLength(255)]
        public string spl1 { get; set; }

        [StringLength(255)]
        public string spl2 { get; set; }

        [StringLength(250)]
        public string Astahov1 { get; set; }

        [StringLength(250)]
        public string Astahov2 { get; set; }

        [StringLength(250)]
        public string res1 { get; set; }

        [StringLength(250)]
        public string res2 { get; set; }

        public Guid rowguid { get; set; }

        public int? NumberML { get; set; }

        public int? timeSlotQuantity { get; set; }

        public bool? signB1 { get; set; }

        public bool? signB2 { get; set; }

        public bool? signB3 { get; set; }

        public int? signI1 { get; set; }

        public int? signI2 { get; set; }

        public int? signI3 { get; set; }

        [StringLength(10)]
        public string signC1 { get; set; }

        [StringLength(10)]
        public string signC2 { get; set; }

        [StringLength(10)]
        public string signC3 { get; set; }

        public DateTime? signD1 { get; set; }

        public DateTime? signD2 { get; set; }

        public DateTime? signD3 { get; set; }

        public int? NoKanN { get; set; }

        public int? NoKanL { get; set; }

        public int? NoKanFe { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] timestamp { get; set; }

        [StringLength(255)]
        public string AdresA_Old { get; set; }

        [StringLength(255)]
        public string AdresB_Old { get; set; }

        [StringLength(128)]
        public string ChangeAddr { get; set; }

        public int? NoKanR { get; set; }

        public int? BridgeId { get; set; }

        [StringLength(255)]
        public string Marking { get; set; }

        public int? BridgeId_B { get; set; }

        [StringLength(255)]
        public string Marking_B { get; set; }

        [StringLength(255)]
        public string PortVlan { get; set; }

        [StringLength(255)]
        public string Vlan { get; set; }

        [StringLength(50)]
        public string spec_project { get; set; }
    }
}
