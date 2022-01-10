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
    public class NotificationsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Notifications
        public ActionResult Index(int? page)
        {
            if (Session["UserID"] != null)
            {
                if (page == null) page = 1;
                var notifications = db.Notifications.OrderByDescending(x => x.NotificationID).ToList();
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(notifications.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        // GET: Admin/Notifications/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notification notification = db.Notifications.Find(id);
            if (notification == null)
            {
                return HttpNotFound();
            }
            return View(notification);
        }

        // GET: Admin/Notifications/Create
        public ActionResult Create()
        {
            Notification noti = new Notification();
            string ma = "";
            if (db.Notifications.Count() == 0)
            {
                ma = "N01";
            }
            else
            {
                ma = db.Notifications.ToList().Last().NotificationID;
                ma = ma.Substring(1);
                int num = int.Parse(ma);
                if (num < 9)
                {
                    ma = "N0" + (num + 1).ToString();
                }
                else
                {
                    ma = "N" + (num + 1).ToString();
                }
            }
            noti.NotificationID = ma;
            return View(noti);

        }

        // POST: Admin/Notifications/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationName,NotificationContent")] Notification notification)
        {

            if (ModelState.IsValid)
            {
                db.Notifications.Add(notification);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(notification);
        }

        // GET: Admin/Notifications/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notification notification = db.Notifications.Find(id);
            if (notification == null)
            {
                return HttpNotFound();
            }
            return View(notification);
        }

        // POST: Admin/Notifications/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationName,NotificationContent")] Notification notification)
        {
            if (ModelState.IsValid)
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(notification);
        }

        // GET: Admin/Notifications/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notification notification = db.Notifications.Find(id);
            if (notification == null)
            {
                return HttpNotFound();
            }
            return View(notification);
        }

        // POST: Admin/Notifications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Notification notification = db.Notifications.Find(id);
            db.Notifications.Remove(notification);
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
