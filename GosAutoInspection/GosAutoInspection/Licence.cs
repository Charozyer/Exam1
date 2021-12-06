namespace GosAutoInspection
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Licence")]
    public partial class Licence
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long LicenceNumber { get; set; }

        public int DriverId { get; set; }

        public int StatusId { get; set; }

        [Column(TypeName = "date")]
        public DateTime LicenceDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime ExpireDate { get; set; }

        [Required]
        [StringLength(50)]
        public string Categories { get; set; }

        public virtual Driver Driver { get; set; }

        public virtual Status Status { get; set; }
    }
}
