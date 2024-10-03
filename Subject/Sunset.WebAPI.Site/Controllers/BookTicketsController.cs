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


		public ActionResult ChoiceSeats(int movieId, int showdateId, int showtimeId)
		{
			ViewBag.movieId = movieId;
			ViewBag.showdateId = showdateId;
			ViewBag.showtimeId = showtimeId;
			return View();
		}

		public ActionResult CheckOrder(int movieScheduleId, List<int> seatIds/*, int memberId*/)
		{
			ViewBag.movieScheduleId = movieScheduleId;
			ViewBag.seatIds = seatIds;
			//ViewBag.memberId = memberId;
			return View();
		}
	}
}