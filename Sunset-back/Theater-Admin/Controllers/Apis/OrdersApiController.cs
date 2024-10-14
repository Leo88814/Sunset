using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Controllers.Apis
{
    public class OrdersApiController : ApiController
    {
        private AppDbContext _db;

        public OrdersApiController()
        {
            _db = new AppDbContext();
        }

        [Route("GetAll")]
        public IHttpActionResult GetAllOrder()
        {
            var Orders = _db.Orders.AsNoTracking().Include("MovieReleaseSchedule");

            return null;

        }


    }
}
