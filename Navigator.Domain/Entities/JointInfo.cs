using System.ComponentModel.DataAnnotations;

namespace Navigator.Domain.Entities
{
    public class JointInfo
    {
        [Key]
        public int NumML { get; set; }

        [StringLength(255)]
        public string AdressA { get; set; }

        [StringLength(255)]
        public string AdressB { get; set; }

        [StringLength(50)]
        public string ChNumA { get; set; }

        [StringLength(50)]
        public string ChNumB { get; set; }

        [StringLength(50)]
        public string JointA { get; set; }

        [StringLength(50)]
        public string JointB { get; set; }

        [StringLength(50)]
        public string JointStatusA { get; set; }

        [StringLength(50)]
        public string JointStatusB { get; set; }

        [StringLength(20)]
        public string JointParamA { get; set; }

        [StringLength(20)]
        public string JointParamB { get; set; }

        [StringLength(10)]
        public string LineA { get; set; }

        [StringLength(10)]
        public string LineB { get; set; }

        [StringLength(10)]
        public string ChannelInfoA { get; set; }

        [StringLength(10)]
        public string ChannelInfoB { get; set; }

        [StringLength(255)]
        public string EqiupmentA { get; set; }

        [StringLength(255)]
        public string EqiupmentB { get; set; }

        [StringLength(128)]
        public string OperatorA { get; set; }

        [StringLength(128)]
        public string OperatorB { get; set; }

        public int? JointIdA { get; set; }

        public int? JointIdB { get; set; }

        [StringLength(64)]
        public string SOChSkorostA { get; set; }

        [StringLength(64)]
        public string SOChSkorostB { get; set; }

        [StringLength(50)]
        public string SOChInterfaceA { get; set; }

        [StringLength(50)]
        public string SOChInterfaceB { get; set; }

        [StringLength(100)]
        public string DMVManagerA { get; set; }

        [StringLength(100)]
        public string DMVManagerB { get; set; }
    }
}
