using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunset.WebAPI.Site.Controllers
{
    public class BookTicketsController : Controller
    {
        // GET: BookTickets
        public ActionResult ChoiceMovie()
        {
            return View();
        }
        public ActionResult ChoiceDate(int id)
        {
            
            return View();
        }
        public ActionResult ChoiceSeat()
        {
            return View();
        }
        public ActionResult CheckOrder()
        {
            return View();
        }
        public ActionResult OrderComplete()
        {
            return View();
        }
    }
}