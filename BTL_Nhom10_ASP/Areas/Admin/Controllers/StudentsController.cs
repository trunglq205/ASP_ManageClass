using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_Nhom10_ASP.Models;
using PagedList;

namespace BTL_Nhom10_ASP.Areas.Admin.Controllers
{
    public class StudentsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Students
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                if (page == null) page = 1;
                var students = (from s in db.Students.Include(s => s.Class)
                                select s).OrderBy(x => x.StudentID);
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(students.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
        //Danh sách sinh viên theo mã lớp
        public ActionResult GetStudentByClassID(string id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var lstStudent = db.Students.Where(x => x.ClassID == id).ToList();
            if (page == null) page = 1;
            var students = (from s in lstStudent
                            select s).OrderBy(x => x.StudentID);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            ViewBag.Class = db.Classes.Find(id);
            return View(students.ToPagedList(pageNumber, pageSize));
        }

        public PartialViewResult GetStudents(string ten, int? page)
        {
            if (page == null) page = 1;
            var lstHocVien = db.Students.Where(x => x.StudentName.Contains(ten)).OrderBy(x=>x.StudentID);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return PartialView("ListStudentPartialView", lstHocVien.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Students/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Admin/Students/Create
        public ActionResult Create()
        {
            Student st = new Student();
            string ma = "";
            if (db.Students.Count() == 0)
            {
                ma = "HV0001";
            }
            else
            {
                ma = db.Students.ToList().Last().StudentID;
                ma = ma.Substring(2);
                int num = int.Parse(ma);
                if (num < 9)
                {
                    ma = "HV000" + (num + 1).ToString();
                }
                else if (num < 99)
                {
                    ma = "HV00" + (num + 1).ToString();
                }
                else if(num < 999)
                {
                    ma = "HV0" + (num + 1).ToString();
                }
                else
                {
                    ma = "HV" + (num + 1).ToString();
                }
            }
            st.StudentID = ma;
            List<Class> lst = db.Classes.ToList();
            lst.ForEach(x =>
            {
                x.ClassName = x.ClassName + " (" + x.ClassID.ToString() + ")";
            });
            ViewBag.ClassID = new SelectList(lst, "ClassID", "ClassName");
            return View(st);
        }

        // POST: Admin/Students/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StudentID,Passcode,StudentName,DateOfBirth,Address,Phone,Picture,ClassID")] Student student)
        {
            if (ModelState.IsValid)
            {
                student.Picture = "";
                var f = Request.Files["ImageFile"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/images/students/" + FileName);
                    f.SaveAs(UploadPath);
                    student.Picture = FileName;
                }
                db.Students.Add(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", student.ClassID);
            return View(student);
        }

        // GET: Admin/Students/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            List<Class> lst = db.Classes.ToList();
            lst.ForEach(x =>
            {
                x.ClassName = x.ClassName + " (" + x.ClassID.ToString() + ")";
            });
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", student.ClassID);
            return View(student);
        }

        // POST: Admin/Students/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StudentID,Passcode,StudentName,DateOfBirth,Address,Phone,Picture,ClassID")] Student student)
        {
            if (ModelState.IsValid)
            {
                var f = Request.Files["ImageFile"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/images/students/" + FileName);
                    f.SaveAs(UploadPath);
                    student.Picture = FileName;
                }
                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", student.ClassID);
            return View(student);
        }

        // GET: Admin/Students/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // POST: Admin/Students/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Student student = db.Students.Find(id);
            db.Students.Remove(student);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
