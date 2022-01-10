namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Class")]
    public partial class Class
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Class()
        {
            Assignments = new HashSet<Assignment>();
            Students = new HashSet<Student>();
            TimeTables = new HashSet<TimeTable>();
        }

        [Key]
        [DisplayName("Mã lớp")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string ClassID { get; set; }

        [DisplayName("Tên lớp")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(100)]
        public string ClassName { get; set; }

        [DisplayName("Giảng viên")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string TeacherID { get; set; }

        [DisplayName("Ngày bắt đầu")]
        [Column(TypeName = "date")]
        public DateTime? StartDay { get; set; }

        [DisplayName("Ngày kết thúc")]
        [Column(TypeName = "date")]
        public DateTime? EndDay { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Assignment> Assignments { get; set; }

        public virtual Teacher Teacher { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Student> Students { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeTable> TimeTables { get; set; }
    }
}
