namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TimeTable")]
    public partial class TimeTable
    {
        [Key]
        [DisplayName("Mã TKB")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string TimeTableID { get; set; }

        [DisplayName("Lớp")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string ClassID { get; set; }

        [DisplayName("Lịch học")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(50)]
        public string Schedule { get; set; }

        public virtual Class Class { get; set; }
    }
}
