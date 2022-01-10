namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Mark")]
    public partial class Mark
    {
        [Key]
        [DisplayName("Mã điểm")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string MarkID { get; set; }

        [DisplayName("Mã học sinh")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string StudentID { get; set; }

        [DisplayName("Mã môn")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string AssigmentID { get; set; }

        [DisplayName("Điểm số")]
        public double Scores { get; set; }

        public virtual Assignment Assignment { get; set; }

        public virtual Student Student { get; set; }
    }
}
