using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class ML_Main
    {
        [Key]
        public int NumMl { get; set; }

        [StringLength(50)]
        public string Nom_Kan { get; set; }

        [StringLength(50)]
        public string EqNum { get; set; }

        [StringLength(255)]
        public string Usluga { get; set; }

        [StringLength(50)]
        public string Pre_Usluga { get; set; }

        [StringLength(255)]
        public string Zakazchik { get; set; }

        [StringLength(30)]
        public string Manager { get; set; }

        [StringLength(11)]
        public string Telefon { get; set; }

        [StringLength(255)]
        public string Osnovanie { get; set; }

        [StringLength(255)]
        public string Kontakt_Ob { get; set; }

        [StringLength(50)]
        public string Kol_vo_kan { get; set; }

        [StringLength(15)]
        public string Skorost { get; set; }

        [StringLength(25)]
        public string QoS { get; set; }

        [StringLength(15)]
        public string Klient { get; set; }

        [StringLength(21)]
        public string Srochnost { get; set; }

        [StringLength(50)]
        public string Data_utv { get; set; }

        [StringLength(100)]
        public string Otvetstv_ULSS { get; set; }

        [StringLength(50)]
        public string Data_ULSS { get; set; }

        [StringLength(255)]
        public string Kabel_prov { get; set; }

        [StringLength(100)]
        public string IP_Adres1 { get; set; }

        [StringLength(100)]
        public string IP_Adres2 { get; set; }

        [StringLength(100)]
        public string Maska1 { get; set; }

        [StringLength(100)]
        public string Maska2 { get; set; }

        [StringLength(50)]
        public string SignalFormat { get; set; }

        public int? NumberRetrans { get; set; }

        [StringLength(25)]
        public string Data_Otkl { get; set; }

        [StringLength(25)]
        public string Chanal_Type { get; set; }

        [StringLength(100)]
        public string DNS { get; set; }

        [StringLength(100)]
        public string Shluz { get; set; }

        [Column(TypeName = "image")]
        public byte[] excel { get; set; }

        [Column(TypeName = "image")]
        public byte[] excel1 { get; set; }

        [StringLength(32)]
        public string PortMMTSNum { get; set; }

        [StringLength(128)]
        public string commutator_id { get; set; }

        [StringLength(128)]
        public string commutator_port { get; set; }
    }
}
