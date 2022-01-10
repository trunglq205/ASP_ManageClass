using BTL_Nhom10_ASP.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BTL_Nhom10_ASP.Controllers
{
    public class ClassesController : Controller
    {
        private Model1 db = new Model1();
        // GET: Classes
        public ActionResult Index()
        {
            if (Session["StudentID"] != null)
            {
                string id = Session["ClassID"].ToString();
                var Class = db.Classes.Find(id);
                List<Assignment> am = db.Assignments.Where(x => x.ClassID == id).ToList();
                List<Subject> lst = new List<Subject>();
                am.ForEach(x =>
                {
                    var Subject = db.Subjects.Find(x.SubjectID);
                    lst.Add(Subject);
                });
                ViewBag.Subject = lst;
                return View(Class);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }

        public ActionResult GetStudentByClassID(string id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var lstStudent = db.Students.Where(x => x.ClassID == id).ToList();
            if (page == null) page = 1;
            var students = (from s in lstStudent
                            select s).OrderBy(x => x.StudentID);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(students.ToPagedList(pageNumber, pageSize));
        }
    }
}