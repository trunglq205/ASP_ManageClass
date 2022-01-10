using BTL_Nhom10_ASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_Nhom10_ASP.Controllers
{
    public class TimeTableController : Controller
    {
        private Model1 db = new Model1();
        // GET: TimeTable
        public ActionResult Index()
        {
            if (Session["StudentID"] != null)
            {
                string id = Session["ClassID"].ToString();
                var TimeTable = db.TimeTables.Where(x => x.ClassID == id);
                return View(TimeTable);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
    }
}