namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [Key]
        [DisplayName("Mã tài khoản")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string UserID { get; set; }

        [DisplayName("Tên tài khoản")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(50)]
        public string UserName { get; set; }

        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(20)]
        public string Password { get; set; }

        [DisplayName("Tên người dùng")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(50)]
        public string Name { get; set; }

        [DisplayName("Vị trí")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(50)]
        public string Position { get; set; }
    }
}
