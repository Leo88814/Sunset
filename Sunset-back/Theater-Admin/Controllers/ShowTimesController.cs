using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Theater_Admin.Controllers
{
    public class ShowTimesController : Controller
    {
        // GET: ShowTime
        public ActionResult ShowtimeIndex() //顯示所有影廳
        {
            return View();
        }

        public ActionResult ShowtimeInAud()
        {
            return View();
        }

        public ActionResult CreateShowtime()
        {
            return View();
        }
    }
}