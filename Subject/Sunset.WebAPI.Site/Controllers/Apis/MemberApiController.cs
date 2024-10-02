using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Repositories;
using Sunset.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Sunset.WebAPI.Site.Controllers.Api
{
	[RoutePrefix("api/MemberApiController")]
	public class MemberApiController : ApiController
    {
		private readonly UserHistoryService _userHistoryService;

        // 預設建構函式
        public MemberApiController()
        {
            _userHistoryService = new UserHistoryService(new UserHistoryRepository(new AppDbContext()));
        }

        public MemberApiController(UserHistoryService userHistoryService)
        {
            _userHistoryService = userHistoryService;
        }

        [HttpGet]
        [Route("UserHistory/{memberId}")]
        public IHttpActionResult UserHistory(string memberId)
        {
            var userHistory = _userHistoryService.GetUserHistoryByMemberId(memberId);
            if (userHistory == null || !userHistory.Any())
            {
                return NotFound();
            }
            return Ok(userHistory);
        }

	}
}
