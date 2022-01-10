
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
    public class MarksController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Marks
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                var lstClass = db.Classes.ToList();
                var lstAssignment = db.Assignments.ToList();
                var lstStudent = db.Students.ToList();

                lstClass.ForEach(x =>
                {
                    foreach (var am in lstAssignment)
                    {
                        if (am.ClassID == x.ClassID)
                        {
                            foreach (var st in lstStudent)
                            {
                                if (st.ClassID == am.ClassID)
                                {
                                    if (!db.Marks.Any(s => s.StudentID == st.StudentID && s.AssigmentID == am.AssignmentID))
                                    {
                                        string markID = "";
                                        if (db.Marks.Count() == 0)
                                        {
                                            markID = "D0001";
                                        }
                                        else
                                        {
                                            markID = db.Marks.ToList().Last().MarkID;
                                            markID = markID.Substring(1);
                                            int markid = int.Parse(markID);
                                            if (markid < 9)
                                            {
                                                markID = "D000" + (markid + 1).ToString();
                                            }
                                            else if (markid < 99)
                                            {
                                                markID = "D00" + (markid + 1).ToString();
                                            }
                                            else if (markid < 999)
                                            {
                                                markID = "D0" + (markid + 1).ToString();
                                            }
                                            else
                                            {
                                                markID = "D" + (markid + 1).ToString();
                                            }

                                        }
                                        db.Marks.Add(new Mark()
                                        {
                                            MarkID = markID,
                                            StudentID = st.StudentID,
                                            AssigmentID = am.AssignmentID,
                                            Scores = 0
                                        });
                                        db.SaveChanges();
                                    }
                                }
                            }
                        }
                    }
                });
                if (page == null) page = 1;
                var classes = (from cl in db.Classes
                               select cl).OrderBy(x => x.ClassID);
                int pageSize = 1;
                int pageNumber = (page ?? 1);
                var marks = db.Marks.Include(m => m.Assignment).Include(m => m.Student).ToList();
                ViewBag.Assignment = db.Assignments.ToList();
                ViewBag.Student = db.Students.ToList();
                ViewBag.Marks = marks;
                return View(classes.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        
        // GET: Admin/Marks/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mark mark = db.Marks.Find(id);
            if (mark == null)
            {
                return HttpNotFound();
            }
            ViewBag.AssigmentID = new SelectList(db.Assignments, "AssignmentID", "ClassID", mark.AssigmentID);
            ViewBag.StudentID = new SelectList(db.Students, "StudentID", "Passcode", mark.StudentID);
            return View(mark);
        }

        // POST: Admin/Marks/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MarkID,StudentID,AssigmentID,Scores")] Mark mark)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mark).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AssigmentID = new SelectList(db.Assignments, "AssignmentID", "ClassID", mark.AssigmentID);
            ViewBag.StudentID = new SelectList(db.Students, "StudentID", "Passcode", mark.StudentID);
            return View(mark);
        }

        // GET: Admin/Marks/Delete/5
        //public ActionResult Delete(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Mark mark = db.Marks.Find(id);
        //    if (mark == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(mark);
        //}

        //// POST: Admin/Marks/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(string id)
        //{
        //    Mark mark = db.Marks.Find(id);
        //    db.Marks.Remove(mark);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

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
