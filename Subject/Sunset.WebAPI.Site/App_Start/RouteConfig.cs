using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Sunset.WebAPI.Site
{
	public class RouteConfig
	{
		public static void RegisterRoutes(RouteCollection routes)
		{
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			routes.MapRoute(
				name: "Default",
				url: "{controller}/{action}/{id}",
				defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
			);

            routes.MapRoute(
               name: "ChoiceSeats",
               url: "BookTickets/ChoiceSeats/{movieId}/{showdateId}/{showtimeId}",
               defaults: new { controller = "BookTickets", action = "ChoiceSeats" }
           );

            routes.MapRoute(
              name: "CheckOrder",
              url: "BookTickets/CheckOrder/{movieScheduleId}/{seatId}",
              defaults: new { controller = "BookTickets", action = "CheckOrder" }
          );
        }
	}
}
