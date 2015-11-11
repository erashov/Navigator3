using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class List2Navv
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int NumML { get; set; }

        [StringLength(255)]
        public string Zakazhcik { get; set; }

        [StringLength(50)]
        public string Usluga { get; set; }

        [StringLength(255)]
        public string AdresA { get; set; }

        [StringLength(50)]
        public string PrivA { get; set; }

        [StringLength(255)]
        public string AdresB { get; set; }

        [StringLength(50)]
        public string PrivB { get; set; }

        [StringLength(50)]
        public string Otvetstv { get; set; }

        [StringLength(50)]
        public string USP { get; set; }

        [StringLength(50)]
        public string E { get; set; }

        [StringLength(50)]
        public string S { get; set; }

        [StringLength(50)]
        public string V { get; set; }

        [StringLength(50)]
        public string T { get; set; }

        [StringLength(50)]
        public string P { get; set; }

        [StringLength(50)]
        public string I { get; set; }

        [StringLength(50)]
        public string R { get; set; }

        [StringLength(50)]
        public string SpecOb { get; set; }

        public DateTime? Sdan { get; set; }

        [StringLength(255)]
        public string Probl { get; set; }

        public DateTime? D_USP { get; set; }

        [StringLength(50)]
        public string D_E { get; set; }

        [StringLength(50)]
        public string D_S { get; set; }

        [StringLength(50)]
        public string D_V { get; set; }

        [StringLength(50)]
        public string D_T { get; set; }

        [StringLength(50)]
        public string D_P { get; set; }

        [StringLength(50)]
        public string D_I { get; set; }

        [StringLength(50)]
        public string D_R { get; set; }

        [StringLength(50)]
        public string D_SpecOb { get; set; }

        public DateTime? utverzh { get; set; }

        [StringLength(50)]
        public string Srochnost { get; set; }

        [StringLength(255)]
        public string Prim { get; set; }

        public DateTime? DUP { get; set; }

        [StringLength(50)]
        public string CSVA { get; set; }

        [StringLength(50)]
        public string CSVB { get; set; }

        public DateTime? DCSV { get; set; }

        [StringLength(50)]
        public string UDA { get; set; }

        [StringLength(50)]
        public string UDB { get; set; }

        public DateTime? DKNV { get; set; }

        public bool? NMR { get; set; }

        public DateTime? DNMR { get; set; }

        public DateTime? ULKS { get; set; }

        public DateTime? OSS { get; set; }

        [StringLength(255)]
        public string Problema1 { get; set; }

        public DateTime? IDO { get; set; }

        public bool? NRUSP { get; set; }

        public bool? NRUSP1 { get; set; }

        public DateTime? D_USP1 { get; set; }

        [StringLength(100)]
        public string MestoNah { get; set; }

        [StringLength(50)]
        public string ProblML { get; set; }

        [StringLength(50)]
        public string a { get; set; }

        public DateTime? b { get; set; }

        public DateTime? c { get; set; }

        [StringLength(50)]
        public string f1 { get; set; }

        [StringLength(50)]
        public string Probl_Data { get; set; }

        public bool? G_A { get; set; }

        public bool? G_B { get; set; }

        public DateTime? Data_Sost_A { get; set; }

        public DateTime? Data_Sost_B { get; set; }

        public DateTime? Data_Vypt_A { get; set; }

        public DateTime? Data_Vypt_B { get; set; }

        public bool? Ivanov_Gulka { get; set; }

        public bool? NRUPK { get; set; }

        public bool? NRUPK1 { get; set; }

        public DateTime? D_UPK { get; set; }

        public DateTime? D_UPK1 { get; set; }

        public DateTime? data_UPK { get; set; }

        public DateTime? data_UPK1 { get; set; }

        public bool? gul_erm { get; set; }

        [StringLength(250)]
        public string res1 { get; set; }

        [StringLength(250)]
        public string ido1 { get; set; }

        [StringLength(250)]
        public string ido2 { get; set; }

        public bool? GG_ULKS { get; set; }

        public DateTime? GG_Data { get; set; }

        [StringLength(250)]
        public string GG_Comment { get; set; }

        public bool? GG_IDO { get; set; }

        public Guid rowguid { get; set; }

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

        [StringLength(500)]
        public string signC3 { get; set; }

        public DateTime? signD1 { get; set; }

        public DateTime? signD2 { get; set; }

        public DateTime? signD3 { get; set; }

        public int? statusML { get; set; }

        [Column(TypeName = "text")]
        public string equpments { get; set; }

        public DateTime? taskFOConnection { get; set; }

        public DateTime? reportFOConnection { get; set; }

        public int? N_eto_StA { get; set; }

        public int? N_eto_StB { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? res1_d { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? res2_d { get; set; }

        [StringLength(50)]
        public string Q { get; set; }

        [StringLength(50)]
        public string D_Q { get; set; }

        public DateTime? Sdan_TS { get; set; }

        public bool? NR_UVK { get; set; }

        public DateTime? D_UVK { get; set; }

        public bool? NR_USHTU { get; set; }

        public DateTime? D_USHTU { get; set; }

        public bool? NR_USHTU_TF { get; set; }

        public DateTime? D_USHTU_TF { get; set; }

        public int? LS_TU_num { get; set; }

        public int? ETO_num { get; set; }

        public bool? NR_UIIAS { get; set; }

        public DateTime? D_UIIAS { get; set; }

        [StringLength(50)]
        public string N { get; set; }

        [StringLength(50)]
        public string D_N { get; set; }

        public DateTime? D_USHTU_Sost { get; set; }

        public DateTime? D_UIIAS_Sost { get; set; }

        public DateTime? D_USHTU_TF_Sost { get; set; }

        [StringLength(50)]
        public string L { get; set; }

        [StringLength(50)]
        public string D_L { get; set; }

        [StringLength(50)]
        public string fe { get; set; }

        [StringLength(50)]
        public string D_fe { get; set; }

        [StringLength(255)]
        public string NDogov { get; set; }

        [StringLength(2048)]
        public string NTelef { get; set; }

        [StringLength(30)]
        public string project_manager { get; set; }

        [StringLength(128)]
        public string SpecProject { get; set; }

        [StringLength(96)]
        public string PortMMTSNum { get; set; }

        public bool? delivEquipment { get; set; }

        [StringLength(128)]
        public string CMT_USHTU_TF { get; set; }

        public bool? NR_Region { get; set; }

        public DateTime? D_Region { get; set; }

        public DateTime? D_Region_Sost { get; set; }

        [StringLength(50)]
        public string CR { get; set; }

        [StringLength(50)]
        public string D_CR { get; set; }

        public bool? Sroch_USHTU { get; set; }

        public DateTime? D_Priv { get; set; }

        [StringLength(30)]
        public string Skorost { get; set; }

        [StringLength(32)]
        public string Styk_A { get; set; }

        [StringLength(32)]
        public string Styk_B { get; set; }

        [StringLength(512)]
        public string Dop_A { get; set; }

        [StringLength(512)]
        public string Dop_B { get; set; }

        public DateTime? SZ_Date { get; set; }

        [StringLength(250)]
        public string Sroch_SZ { get; set; }

        [StringLength(128)]
        public string ChangeAddr { get; set; }

        [StringLength(255)]
        public string AdresB_Old { get; set; }

        [StringLength(255)]
        public string AdresA_Old { get; set; }

        [StringLength(50)]
        public string QC { get; set; }

        [StringLength(50)]
        public string D_QC { get; set; }

        [StringLength(50)]
        public string Line_PrivA { get; set; }

        [StringLength(255)]
        public string ContractSO { get; set; }

        [StringLength(255)]
        public string OrderNumSO { get; set; }

        [StringLength(50)]
        public string SONum { get; set; }

        public DateTime? DateSONum { get; set; }

        [StringLength(128)]
        public string Operator { get; set; }

        public DateTime? RemoveShleifSO { get; set; }

        public int? IdMLGroup { get; set; }

        [StringLength(255)]
        public string MLGroupMembers { get; set; }

        public bool? IsFreezeMLGroupMember { get; set; }

        public DateTime? StartDateOPKR { get; set; }

        public DateTime? EndDateOPKR { get; set; }

        public bool? ReturnedFromUSP { get; set; }

        public int? BridgeId { get; set; }

        [StringLength(255)]
        public string Marking { get; set; }

        public int? BridgeId_B { get; set; }

        [StringLength(255)]
        public string Marking_B { get; set; }

        public DateTime? FactDateUSP_A { get; set; }

        public DateTime? FactDateUSP_B { get; set; }

        [StringLength(15)]
        public string Klient { get; set; }

        public DateTime? signD4 { get; set; }

        [StringLength(1024)]
        public string signC4 { get; set; }

        public int? signI4 { get; set; }

        [StringLength(500)]
        public string test_res_a { get; set; }

        public DateTime? test_date_a { get; set; }

        [StringLength(500)]
        public string test_res_b { get; set; }

        public DateTime? test_date_b { get; set; }

        public bool HasTasks { get; set; }

        public DateTime? D_GPU_TF_Sost { get; set; }

        public DateTime? D_GPU_TF { get; set; }
    }
}
