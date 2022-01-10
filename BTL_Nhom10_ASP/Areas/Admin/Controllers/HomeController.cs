using BTL_Nhom10_ASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_Nhom10_ASP.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private Model1 db = new Model1();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["UserID"] != null)
            {
                int tongSoLop = db.Classes.ToList().Count();
                int tongSoGV = db.Teachers.ToList().Count();
                int tongSoHV = db.Students.ToList().Count();
                int tongThongBao = db.Notifications.ToList().Count();
                ViewBag.SoLop = tongSoLop;
                ViewBag.SoGV = tongSoGV;
                ViewBag.SoHV = tongSoHV;
                ViewBag.SoTB = tongThongBao;
                return View();
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
        public ActionResult Login(string username, string password)
        {
            var user = db.Users.Where(x => (x.UserID == username || x.UserName == username) && x.Password == password).ToList();
            if (user.Count > 0)
            {
                Session["UserID"] = user.FirstOrDefault().UserID;
                Session["Username"] = user.FirstOrDefault().UserName;
                Session["Name"] = user.FirstOrDefault().Name;
                Session["Position"] = user.FirstOrDefault().Position;
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