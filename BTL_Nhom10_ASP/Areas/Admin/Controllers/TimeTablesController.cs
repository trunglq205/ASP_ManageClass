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
    public class TimeTablesController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/TimeTables
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                if (page == null) page = 1;
                var timeTables = db.TimeTables.Include(t => t.Class).OrderBy(x => x.TimeTableID);
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(timeTables.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        // GET: Admin/TimeTables/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTable timeTable = db.TimeTables.Find(id);
            if (timeTable == null)
            {
                return HttpNotFound();
            }
            return View(timeTable);
        }

        // GET: Admin/TimeTables/Create
        public ActionResult Create()
        {
            TimeTable tt = new TimeTable();
            string ma = "";
            if (db.TimeTables.Count() == 0)
            {
                ma = "TKB01";
            }
            else
            {
                ma = db.TimeTables.ToList().Last().TimeTableID;
                ma = ma.Substring(3);
                int num = int.Parse(ma);
                if (num < 9)
                {
                    ma = "TKB0" + (num + 1).ToString();
                }
                else
                {
                    ma = "TKB" + (num + 1).ToString();
                }
            }
            tt.TimeTableID = ma;
            List<Class> lst = db.Classes.ToList();
            lst.ForEach(x =>
            {
                x.ClassName = x.ClassName + " (" + x.ClassID.ToString() + ")";
            });
            ViewBag.ClassID = new SelectList(lst, "ClassID", "ClassName");
            return View(tt);
        }

        // POST: Admin/TimeTables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TimeTableID,ClassID,Schedule")] TimeTable timeTable)
        {
            if (ModelState.IsValid)
            {
                db.TimeTables.Add(timeTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", timeTable.ClassID);
            return View(timeTable);
        }

        // GET: Admin/TimeTables/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTable timeTable = db.TimeTables.Find(id);
            if (timeTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", timeTable.ClassID);
            return View(timeTable);
        }

        // POST: Admin/TimeTables/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TimeTableID,ClassID,Schedule")] TimeTable timeTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(timeTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "ClassName", timeTable.ClassID);
            return View(timeTable);
        }

        // GET: Admin/TimeTables/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTable timeTable = db.TimeTables.Find(id);
            if (timeTable == null)
            {
                return HttpNotFound();
            }
            return View(timeTable);
        }

        // POST: Admin/TimeTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            TimeTable timeTable = db.TimeTables.Find(id);
            db.TimeTables.Remove(timeTable);
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
