using BTL_Nhom10_ASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;

namespace BTL_Nhom10_ASP.Controllers
{
    public class MarksController : Controller
    {
        private Model1 db = new Model1();
        // GET: Marks
        public ActionResult Index()
        {
            if (Session["StudentID"] != null)
            {
                string id = Session["ClassID"].ToString();
                ViewBag.Class = db.Classes.Find(id);
                List<Assignment> am = db.Assignments.Where(x => x.ClassID == id).ToList();
                List<Subject> lst = new List<Subject>();
                string stdid = Session["StudentID"].ToString();
                var marks = db.Marks.Include(m => m.Assignment).Include(m => m.Student).Where(x => x.StudentID == stdid);
                ViewBag.Mark = marks;
                return View(am);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
    }
}