﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Sunset.WebAPI.Site.Controllers
{
    public class MemberController : Controller
    {
        // GET: Member
        public ActionResult UserHistory()
        {
            return View();
        }
        public ActionResult OrderDetails()
        {
            return View();
        }
        public ActionResult Tickets()
        {
            return View();
        }
        public ActionResult TransactionHistory()
        {
            return View();
        }
    }
}