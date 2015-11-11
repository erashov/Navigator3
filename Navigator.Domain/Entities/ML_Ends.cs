using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Navigator.Domain.Entities
{
    public class ML_Ends
    {
        [Key]
        [Column(Order = 0)]
        public int NumMl { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(25)]
        public string Okonchanie { get; set; }

        [StringLength(100)]
        public string Styk { get; set; }

        [StringLength(100)]
        public string Styk1 { get; set; }

        [StringLength(100)]
        public string Line_Priv { get; set; }

        [StringLength(100)]
        public string Status_Styka { get; set; }

        [StringLength(50)]
        public string Param_Styka { get; set; }

        [StringLength(255)]
        public string Adres { get; set; }

        [StringLength(255)]
        public string Kontakt { get; set; }

        [StringLength(1024)]
        public string Dop { get; set; }

        [StringLength(100)]
        public string ML_Dostupa { get; set; }

        [StringLength(100)]
        public string VPN { get; set; }

        [StringLength(100)]
        public string ASNum { get; set; }

        [StringLength(100)]
        public string GatewayAdres { get; set; }

        [StringLength(100)]
        public string NetAdres { get; set; }

        [StringLength(100)]
        public string NetMask { get; set; }

        [StringLength(255)]
        public string RouteType { get; set; }

        [StringLength(255)]
        public string Adres_Old { get; set; }

        [StringLength(128)]
        public string ChangeAddr { get; set; }

        [StringLength(100)]
        public string CameraModel { get; set; }

        [StringLength(100)]
        public string NumC { get; set; }

        [StringLength(512)]
        public string NatEquipment { get; set; }

        [StringLength(255)]
        public string IpType { get; set; }

        [StringLength(256)]
        public string num_rosette { get; set; }

        [StringLength(256)]
        public string crypto { get; set; }
    }
}
