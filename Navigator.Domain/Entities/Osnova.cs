namespace Navigator.Domain.Entities
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Osnova")]
    public class Osnova
    {
        [Key]
        public int NumML { get; set; }

        [StringLength(25)]
        public string Pre_Usluga { get; set; }

        [StringLength(125)]
        public string Usluga { get; set; }

        [StringLength(50)]
        public string Nom_Kan { get; set; }

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

        [StringLength(30)]
        public string Skorost { get; set; }

        [StringLength(50)]
        public string Kol_vo_kan { get; set; }

        [StringLength(15)]
        public string Klient { get; set; }

        [StringLength(21)]
        public string Srochnost { get; set; }

        [StringLength(32)]
        public string Styk_A { get; set; }

        [StringLength(15)]
        public string Styk_A1 { get; set; }

        [StringLength(15)]
        public string Status_StykA { get; set; }

        [StringLength(50)]
        public string Line_PrivA { get; set; }

        [StringLength(255)]
        public string Adres_A { get; set; }

        [StringLength(255)]
        public string Kontakt_A { get; set; }

        [StringLength(512)]
        public string Dop_A { get; set; }

        [StringLength(32)]
        public string Styk_B { get; set; }

        [StringLength(15)]
        public string Styk_B1 { get; set; }

        [StringLength(15)]
        public string Status_StykB { get; set; }

        [StringLength(6)]
        public string Line_PrivB { get; set; }

        [StringLength(255)]
        public string Adres_B { get; set; }

        [StringLength(255)]
        public string Kontakt_B { get; set; }

        [StringLength(512)]
        public string Dop_B { get; set; }

        public DateTime? Utverzh_M { get; set; }

        public DateTime? Utverzh_B { get; set; }

        public bool? Pr_ULKS { get; set; }

        public bool? Pr_USP { get; set; }

        public bool? Pr_UUK { get; set; }

        public bool? Pr_UPK { get; set; }

        public bool? Pr_USHKm { get; set; }

        public bool? Pr_USHKn { get; set; }

        [StringLength(10)]
        public string Kodir_Usl { get; set; }

        public bool? Pr_Obr { get; set; }

        [StringLength(150)]
        public string town1 { get; set; }

        [StringLength(150)]
        public string Street1 { get; set; }

        [StringLength(10)]
        public string Dom1 { get; set; }

        [StringLength(120)]
        public string Str1 { get; set; }

        [StringLength(120)]
        public string Kor1 { get; set; }

        [StringLength(150)]
        public string flow1 { get; set; }

        [StringLength(150)]
        public string romm1 { get; set; }

        [StringLength(150)]
        public string town2 { get; set; }

        [StringLength(150)]
        public string Street2 { get; set; }

        [StringLength(10)]
        public string Dom2 { get; set; }

        [StringLength(120)]
        public string Str2 { get; set; }

        [StringLength(120)]
        public string Kor2 { get; set; }

        [StringLength(150)]
        public string flow2 { get; set; }

        [StringLength(150)]
        public string romm2 { get; set; }

        [StringLength(250)]
        public string Otv_k_utv { get; set; }

        public Guid rowguid { get; set; }

        public DateTime? dateConfirmAct { get; set; }

        public DateTime? dateLotusAct { get; set; }

        public int? numberLotusAct { get; set; }

        public bool? signB1 { get; set; }

        public bool? signB2 { get; set; }

        public bool? signB3 { get; set; }

        public int? signI1 { get; set; }

        public int? signI2 { get; set; }

        public int? signI3 { get; set; }

        [StringLength(100)]
        public string signC1 { get; set; }

        [StringLength(1024)]
        public string signC2 { get; set; }

        [StringLength(100)]
        public string signC3 { get; set; }

        public DateTime? signD1 { get; set; }

        public DateTime? signD2 { get; set; }

        public DateTime? signD3 { get; set; }

        public int? N_eto_StA { get; set; }

        public int? N_eto_StB { get; set; }

        [StringLength(25)]
        public string ParamStyk1 { get; set; }

        [StringLength(25)]
        public string ParamStyk2 { get; set; }

        [StringLength(25)]
        public string QoS { get; set; }

        public DateTime? List2TS { get; set; }

        public int? ETO_num { get; set; }

        public int? LS_TU_num { get; set; }

        [StringLength(30)]
        public string project_manager { get; set; }

        [StringLength(128)]
        public string SpecProject { get; set; }

        [StringLength(255)]
        public string Adres_A_old { get; set; }

        [StringLength(255)]
        public string Adres_B_old { get; set; }

        [StringLength(128)]
        public string ChangeAddr { get; set; }

        [StringLength(255)]
        public string AdresA_Old { get; set; }

        [StringLength(255)]
        public string AdresB_Old { get; set; }

        public int? BridgeId { get; set; }

        [StringLength(255)]
        public string Marking { get; set; }

        public int? BridgeId_B { get; set; }

        [StringLength(255)]
        public string Marking_B { get; set; }

        public int? call_back { get; set; }

        [StringLength(255)]
        public string room_BC1 { get; set; }

        [StringLength(255)]
        public string room_BC2 { get; set; }
    }
}
