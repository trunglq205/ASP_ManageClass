namespace BTL_Nhom10_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Subject")]
    public partial class Subject
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Subject()
        {
            Assignments = new HashSet<Assignment>();
        }

        [Key]
        [DisplayName("Mã môn học")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(10)]
        public string SubjectID { get; set; }

        [DisplayName("Tên môn học")]
        [Required(ErrorMessage = "Không được để trống!")]
        [StringLength(100)]
        public string SubjectName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Assignment> Assignments { get; set; }
    }
}
