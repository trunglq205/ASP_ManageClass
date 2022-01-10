namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Teacher")]
    public partial class Teacher
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Teacher()
        {
            Classes = new HashSet<Class>();
        }

        [Key]
        [DisplayName("Mã giảng viên")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string TeacherID { get; set; }

        [DisplayName("Tên giảng viên")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(50)]
        public string TeacherName { get; set; }

        [DisplayName("Ngày sinh")]
        [Column(TypeName = "date")]
        [Required(ErrorMessage = "Không được để trống!")]
        public DateTime DateOfBirth { get; set; }

        [DisplayName("Địa chỉ")]
        [StringLength(50)]
        public string Addres { get; set; }

        [DisplayName("Số điện thoại")]
        [StringLength(15)]
        public string Phone { get; set; }

        [DisplayName("Ảnh")]
        [StringLength(50)]
        public string Picture { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Class> Classes { get; set; }
    }
}
