namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Notification")]
    public partial class Notification
    {
        [Key]
        [StringLength(10)]
        [DisplayName("Mã thông báo")]
        [Required(ErrorMessage = "Không được để trống!")]
        public string NotificationID { get; set; }

        [DisplayName("Tên thông báo")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(200)]
        public string NotificationName { get; set; }

        [DisplayName("Nội dung")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(500)]
        public string NotificationContent { get; set; }
    }
}
