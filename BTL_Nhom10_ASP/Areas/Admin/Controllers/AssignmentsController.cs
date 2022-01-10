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
    public class AssignmentsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Assignments
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                if (page == null) page = 1;
                var classes = (from cl in db.Classes
                               select cl).OrderBy(x => x.ClassID);
                int pageSize = 1;
                int pageNumber = (page ?? 1);
                ViewBag.Assignments = db.Assignments.Include(a => a.Class).Include(a => a.Subject);
                return View(classes.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        // GET: Admin/Assignments/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Assignment assignment = db.Assignments.Find(id);
            if (assignment == null)
            {
                return HttpNotFound();
            }
            return View(assignment);
        }

        // GET: Admin/Assignments/Create
        public ActionResult Create()
        {
            Assignment am = new Assignment();
            string ma = "";
            if (db.Assignments.Count() == 0)
            {
                ma = "A001";
            }
            else
            {
                ma = db.Assignments.ToList().Last().AssignmentID;
                ma = ma.Substring(1);
                int num = int.Parse(ma);
                if (num < 9)
                {
                    ma = "A00" + (num + 1).ToString();
                }
                if (num < 99)
                {
                    ma = "A0" + (num + 1).ToString();
                }
                else
                {
                    ma = "A" + (num + 1).ToString();
                }
            }
            am.AssignmentID = ma;
            List<Class> lst1 = db.Classes.ToList();
            lst1.ForEach(x =>
            {
                x.ClassName = x.ClassName + " (" + x.ClassID.ToString() + ")";
            });
            List<Subject> lst2 = db.Subjects.ToList();
            lst2.ForEach(x =>
            {
                x.SubjectName = x.SubjectName + " (" + x.SubjectID.ToString() + ")";
            });
            ViewBag.ClassID = new SelectList(lst1, "ClassID", "ClassName");
            ViewBag.SubjectID = new SelectList(lst2, "SubjectID", "SubjectName");
            return View(am);
        }

        // POST: Admin/Assignments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AssignmentID,ClassID,SubjectID")] Assignment assignment)
        {
            if (ModelState.IsValid)
            {
                db.Assignments.Add(assignment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", assignment.ClassID);
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "SubjectName", assignment.SubjectID);
            return View(assignment);
        }

        // GET: Admin/Assignments/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Assignment assignment = db.Assignments.Find(id);
            if (assignment == null)
            {
                return HttpNotFound();
            }
            List<Subject> lst = db.Subjects.ToList();
            lst.ForEach(x =>
            {
                x.SubjectName = x.SubjectName + " (" + x.SubjectID.ToString() + ")";
            });
            ViewBag.SubjectID = new SelectList(lst, "SubjectID", "SubjectName", assignment.SubjectID);
            return View(assignment);
        }

        // POST: Admin/Assignments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AssignmentID,ClassID,SubjectID")] Assignment assignment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(assignment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "SubjectName", assignment.SubjectID);
            return View(assignment);
        }

        // GET: Admin/Assignments/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Assignment assignment = db.Assignments.Find(id);
            if (assignment == null)
            {
                return HttpNotFound();
            }
            return View(assignment);
        }

        // POST: Admin/Assignments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Assignment assignment = db.Assignments.Find(id);
            db.Assignments.Remove(assignment);
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
