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
    public class ClassesController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Classes
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                if (page == null) page = 1;
                var classes = db.Classes.Include(s => s.Teacher).OrderBy(x => x.ClassID).ToList();
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(classes.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        // GET: Admin/Classes/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class @class = db.Classes.Find(id);
            if (@class == null)
            {
                return HttpNotFound();
            }
            return View(@class);
        }

        // GET: Admin/Classes/Create
        public ActionResult Create()
        {
            Class cl = new Class();
            string ma = "";
            if (db.Classes.Count() == 0)
            {
                ma = "C01";
            }
            else
            {
                ma = db.Classes.ToList().Last().ClassID;
                ma = ma.Substring(1);
                int num = int.Parse(ma);
                if (num < 9)
                {
                    ma = "C0" + (num + 1).ToString();
                }
                else
                {
                    ma = "C" + (num + 1).ToString();
                }
            }
            cl.ClassID = ma;
            List<Teacher> lst = db.Teachers.ToList();
            lst.ForEach(x =>
            {
                x.TeacherName = x.TeacherName + " (" + x.TeacherID.ToString() + ")";
            });
            ViewBag.TeacherID = new SelectList(lst, "TeacherID", "TeacherName");
            return View(cl);
        }

        // POST: Admin/Classes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClassID,ClassName,TeacherID,StartDay,EndDay")] Class @class)
        {
            if (ModelState.IsValid)
            {
                db.Classes.Add(@class);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName", @class.TeacherID);
            return View(@class);
        }

        // GET: Admin/Classes/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class @class = db.Classes.Find(id);
            if (@class == null)
            {
                return HttpNotFound();
            }
            List<Teacher> lst = db.Teachers.ToList();
            lst.ForEach(x =>
            {
                x.TeacherName = x.TeacherName + " (" + x.TeacherID.ToString() + ")";
            });
            ViewBag.TeacherID = new SelectList(lst, "TeacherID", "TeacherName", @class.TeacherID);
            return View(@class);
        }

        // POST: Admin/Classes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClassID,ClassName,TeacherID,StartDay,EndDay")] Class @class)
        {
            if (ModelState.IsValid)
            {
                db.Entry(@class).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "TeacherName", @class.TeacherID);
            return View(@class);
        }

        // GET: Admin/Classes/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class @class = db.Classes.Find(id);
            if (@class == null)
            {
                return HttpNotFound();
            }
            return View(@class);
        }

        // POST: Admin/Classes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Class @class = db.Classes.Find(id);
            db.Classes.Remove(@class);
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
