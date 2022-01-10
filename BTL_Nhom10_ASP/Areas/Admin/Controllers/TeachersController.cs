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
    public class TeachersController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Teachers
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                if (page == null) page = 1;
                var students = db.Teachers.OrderBy(x => x.TeacherID);
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(students.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        // GET: Admin/Teachers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Teacher teacher = db.Teachers.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            return View(teacher);
        }

        // GET: Admin/Teachers/Create
        public ActionResult Create()
        {
            Teacher t = new Teacher();
            string ma = "";
            if (db.Teachers.Count() == 0)
            {
                ma = "GV01";
            }
            else
            {
                ma = db.Teachers.ToList().Last().TeacherID;
                ma = ma.Substring(2);
                int num = int.Parse(ma);
                if (num < 9)
                {
                    ma = "GV0" + (num + 1).ToString();
                }
                else
                {
                    ma = "GV" + (num + 1).ToString();
                }
            }
            t.TeacherID = ma;
            return View(t);
        }

        // POST: Admin/Teachers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TeacherID,TeacherName,DateOfBirth,Addres,Phone,Picture")] Teacher teacher)
        {
            if (ModelState.IsValid)
            {
                teacher.Picture = "";
                var f = Request.Files["ImageFile"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/images/teachers/" + FileName);
                    f.SaveAs(UploadPath);
                    teacher.Picture = FileName;
                }
                db.Teachers.Add(teacher);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(teacher);
        }

        // GET: Admin/Teachers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Teacher teacher = db.Teachers.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            return View(teacher);
        }

        // POST: Admin/Teachers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TeacherID,TeacherName,DateOfBirth,Addres,Phone,Picture")] Teacher teacher)
        {
            if (ModelState.IsValid)
            {
                teacher.Picture = "";
                var f = Request.Files["ImageFile"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/wwwroot/images/teachers/" + FileName);
                    f.SaveAs(UploadPath);
                    teacher.Picture = FileName;
                }
                db.Entry(teacher).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(teacher);
        }

        // GET: Admin/Teachers/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Teacher teacher = db.Teachers.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            return View(teacher);
        }

        // POST: Admin/Teachers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Teacher teacher = db.Teachers.Find(id);
            db.Teachers.Remove(teacher);
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
