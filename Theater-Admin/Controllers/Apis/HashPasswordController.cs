using BookStore.FrontEnd.Site.Models.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/test")]
    public class HashPasswordController : ApiController
    {
        [HttpPost]
        [Route("gethash")]
        public IHttpActionResult gethashpasword(testDto dto)
        {
            string hashPassword = HashUtility.ToSHA256(dto.password);

            return Ok(hashPassword);

        }

    }
}
