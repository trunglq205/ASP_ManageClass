using BTL_Nhom10_ASP.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_Nhom10_ASP.Controllers
{
    public class HomeController : Controller
    {
        private Model1 db = new Model1();
        public ActionResult Index(int? page)
        {
            if (Session["StudentID"] != null)
            {
                if (page == null) page = 1;
                var notifications = db.Notifications.OrderByDescending(x => x.NotificationID).ToList();
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(notifications.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string studentID, string studentPassword)
        {
            var user = db.Students.Where(x => x.StudentID == studentID && x.Passcode == studentPassword).ToList();
            if (user.Count > 0)
            {
                Session["StudentID"] = user.FirstOrDefault().StudentID;
                Session["StudentName"] = user.FirstOrDefault().StudentName;
                Session["Picture"] = user.FirstOrDefault().Picture;
                Session["ClassID"] = user.FirstOrDefault().ClassID;
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Error = "Tài khoản hoặc mật khẩu không chính xác";
            }

            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}