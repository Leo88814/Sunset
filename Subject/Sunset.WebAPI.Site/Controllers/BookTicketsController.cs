﻿using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
//using System.Web.Http;
using System.Web.Mvc;
using System.Web.Security;

namespace Sunset.WebAPI.Site.Controllers
{
	public class BookTicketsController : Controller
	{
		// GET: BookTickets
		[Authorize]
		public ActionResult ChoiceMovies()
		{
			return View();
		}
        [Authorize]
        public ActionResult ChoiceDates(int id)
		{
			ViewBag.DateId = id;
			return View();
		}

        [Authorize]
        public ActionResult ChoiceSeats(int movieId, int showdateId, int showtimeId)
		{
			ViewBag.movieId = movieId;
			ViewBag.showdateId = showdateId;
			ViewBag.showtimeId = showtimeId;
			return View();
		}
        [Authorize]
        public ActionResult CheckOrder(int movieScheduleId, string seats)
		{
			ViewBag.movieScheduleId = movieScheduleId;
			ViewBag.seatsId = seats;
			return View();
		}
        [Authorize]
        public ActionResult OrderComplete()
		{
			return View();
		}
	}
}