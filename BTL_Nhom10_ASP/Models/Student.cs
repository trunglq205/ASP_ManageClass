namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Student")]
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            Marks = new HashSet<Mark>();
        }

        [Key]
        [DisplayName("Mã học viên")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string StudentID { get; set; }

        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(20)]
        public string Passcode { get; set; }

        [DisplayName("Tên học viên")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(50)]
        public string StudentName { get; set; }

        [DisplayName("Ngày sinh")]
        [Column(TypeName = "date")]
        [Required(ErrorMessage = "Không được để trống!")]
        public DateTime DateOfBirth { get; set; }

        [DisplayName("Địa chỉ")]
        [StringLength(50)]
        public string Address { get; set; }

        [DisplayName("Số điện thoại")]
        [StringLength(15)]
        public string Phone { get; set; }

        [DisplayName("Ảnh")]
        [StringLength(50)]
        public string Picture { get; set; }

        [DisplayName("Lớp")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string ClassID { get; set; }

        public virtual Class Class { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mark> Marks { get; set; }
    }
}
