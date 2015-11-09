using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    [Table("RouteSheets")]
    public class RouteSheet
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int NumML { get; set; }

        public DateTime? utverzh { get; set; }

        [StringLength(50)]
        public string Otvetstv { get; set; }

        [StringLength(255)]
        public string Zakazhcik { get; set; }

        [StringLength(510)]
        public string Adres { get; set; }

        [StringLength(255)]
        public string AdresA { get; set; }

        [StringLength(255)]
        public string AdresB { get; set; }

        [StringLength(50)]
        public string Usluga { get; set; }

        [StringLength(30)]
        public string Skorost { get; set; }

        [StringLength(32)]
        public string Styk_A { get; set; }

        [StringLength(32)]
        public string Styk_B { get; set; }

        [StringLength(50)]
        public string PrivA { get; set; }

        [StringLength(50)]
        public string PrivB { get; set; }

        [StringLength(50)]
        public string UDA { get; set; }

        [StringLength(50)]
        public string UDB { get; set; }

        [StringLength(50)]
        public string SpecOb { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(550)]
        public string ESVTPIQQCNfe { get; set; }

        [StringLength(50)]
        public string E { get; set; }

        [StringLength(50)]
        public string L { get; set; }

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
        public string Q { get; set; }

        [StringLength(50)]
        public string QC { get; set; }

        [StringLength(50)]
        public string N { get; set; }

        [StringLength(50)]
        public string fe { get; set; }

        [StringLength(255)]
        public string Probl { get; set; }

        [StringLength(255)]
        public string Prim { get; set; }

        [StringLength(128)]
        public string Operator { get; set; }

        public DateTime? test_date_a { get; set; }

        public DateTime? test_date_b { get; set; }

        [StringLength(500)]
        public string test_res_a { get; set; }

        [StringLength(500)]
        public string test_res_b { get; set; }

        [StringLength(128)]
        public string SpecProject { get; set; }

        [StringLength(250)]
        public string Sroch_SZ { get; set; }

        public bool? Sroch_USHTU { get; set; }

        public DateTime? taskFOConnection { get; set; }

        public bool? Ivanov_Gulka { get; set; }

        public bool? NMR { get; set; }

        public DateTime? Sdan { get; set; }

        public DateTime? Sdan_TS { get; set; }

        [StringLength(50)]
        public string ProblML { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? res1_d { get; set; }

        public DateTime? Data_Sost_A { get; set; }

        public DateTime? Data_Sost_B { get; set; }

        [Key]
        [Column(Order = 2)]
        public bool HasTasks { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? StopDate { get; set; }

        public DateTime? gplr_start { get; set; }

        public DateTime? gplr_end { get; set; }

        [StringLength(5)]
        public string gplrIsCanceled { get; set; }

        public DateTime? gplr2_start { get; set; }

        public DateTime? gplr2_end { get; set; }

        [StringLength(5)]
        public string gplr2IsCanceled { get; set; }

        public DateTime? dmv_start { get; set; }

        public DateTime? dmv_end { get; set; }

        [StringLength(5)]
        public string dmvIsCanceled { get; set; }

        public DateTime? dmv2_start { get; set; }

        public DateTime? dmv2_end { get; set; }

        [StringLength(5)]
        public string dmv2IsCanceled { get; set; }

        public DateTime? osp_start { get; set; }

        public DateTime? osp_end { get; set; }

        [StringLength(5)]
        public string ospIsCanceled { get; set; }

        public DateTime? uiias_h_start { get; set; }

        public DateTime? uiias_h_end { get; set; }

        [StringLength(5)]
        public string uiias_hIsCanceled { get; set; }

        public DateTime? oshugpu_start { get; set; }

        public DateTime? oshugpu_end { get; set; }

        [StringLength(5)]
        public string oshugpuIsCanceled { get; set; }

        public DateTime? oshugpz_start { get; set; }

        public DateTime? oshugpz_end { get; set; }

        [StringLength(5)]
        public string oshugpzIsCanceled { get; set; }

        public DateTime? to_start { get; set; }

        public DateTime? to_end { get; set; }

        [StringLength(5)]
        public string toIsCanceled { get; set; }

        public DateTime? to2_start { get; set; }

        public DateTime? to2_end { get; set; }

        [StringLength(5)]
        public string to2IsCanceled { get; set; }

        public DateTime? otse_start { get; set; }

        public DateTime? otse_end { get; set; }

        [StringLength(5)]
        public string otseIsCanceled { get; set; }

        public DateTime? otse2_start { get; set; }

        public DateTime? otse2_end { get; set; }

        [StringLength(5)]
        public string otse2IsCanceled { get; set; }

        public DateTime? otss_start { get; set; }

        public DateTime? otss_end { get; set; }

        [StringLength(5)]
        public string otssIsCanceled { get; set; }

        public DateTime? otss2_start { get; set; }

        public DateTime? otss2_end { get; set; }

        [StringLength(5)]
        public string otss2IsCanceled { get; set; }

        public DateTime? otu_start { get; set; }

        public DateTime? otu_end { get; set; }

        [StringLength(5)]
        public string otuIsCanceled { get; set; }

        public DateTime? otvu_start { get; set; }

        public DateTime? otvu_end { get; set; }

        [StringLength(5)]
        public string otvuIsCanceled { get; set; }

        public int? oshugpz_ReportExist { get; set; }


        public int gplr_ReportExist { get; set; }

        public int? otsod_ReportExist { get; set; }

        public int? osp_ReportExist { get; set; }

        public int? otse_ReportExist { get; set; }

        public int? otss_ReportExist { get; set; }

        public int? otvu_ReportExist { get; set; }

        public int? otu_ReportExist { get; set; }

        public int? to_ReportExist { get; set; }

        public int dmv_ReportExist { get; set; }

        public int? ushugpu_ReportExist { get; set; }
        public int? Freeze_ReportExist { get; set; }

        [StringLength(50)]
        public string ChNumA { get; set; }

        [StringLength(50)]
        public string ChNumB { get; set; }

        [StringLength(255)]
        public string AdressA { get; set; }

        [StringLength(255)]
        public string AdressB { get; set; }

        [StringLength(5)]
        public string goml { get; set; }

        [StringLength(4)]
        public string gpz { get; set; }

        [StringLength(5)]
        public string gplr { get; set; }

        [StringLength(5)]
        public string ocod { get; set; }

        [StringLength(4)]
        public string osp { get; set; }

        [StringLength(7)]
        public string otce { get; set; }

        [StringLength(7)]
        public string otcs { get; set; }

        [StringLength(5)]
        public string otvu { get; set; }

        [StringLength(4)]
        public string otu { get; set; }

        [StringLength(4)]
        public string otr { get; set; }

        [Column("_to")]
        [StringLength(3)]
        public string C_to { get; set; }

        [StringLength(4)]
        public string dmv { get; set; }

        [StringLength(7)]
        public string oshugpu { get; set; }

        [StringLength(152)]
        public string USERs { get; set; }

        [StringLength(50)]
        public string Login { get; set; }

        public DateTime? TaskReturns { get; set; }

        public string TaskCancels { get; set; }
    }
}
