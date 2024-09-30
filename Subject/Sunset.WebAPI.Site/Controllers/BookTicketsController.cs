using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunset.WebAPI.Site.Controllers
{
    public class BookTicketsController : Controller
    {
        // GET: BookTickets
        public ActionResult ChoiceMovies()
        {
            return View();
        }
		public ActionResult ChoiceDates(int id)
		{
			
			ViewBag.DateId = id;
			return View();
		}
		public ActionResult ChoiceSeats(int id)
		{

			ViewBag.SeatId = id;
			return View();
		}
	}
}