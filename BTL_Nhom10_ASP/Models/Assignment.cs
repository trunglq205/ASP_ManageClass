namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Assignment")]
    public partial class Assignment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Assignment()
        {
            Marks = new HashSet<Mark>();
        }
        [Key]
        [DisplayName("Mã phân môn")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string AssignmentID { get; set; }

        [DisplayName("Lớp")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string ClassID { get; set; }

        [DisplayName("Môn học")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string SubjectID { get; set; }

        public virtual Class Class { get; set; }

        public virtual Subject Subject { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mark> Marks { get; set; }
    }
}
