using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Repositories;
using Sunset.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Sunset.WebAPI.Site.Models.Dtos;
using System.Web.Security;

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
        [Route("UserHistory")]
        public IHttpActionResult UserHistory()
        {
            var authHeader = Request.Headers.Authorization;
            if (authHeader == null || authHeader.Scheme != "Bearer")
            {
                return Unauthorized();
            }

            var token = authHeader.Parameter;
            var memberId = GetMemberIdFromToken(token); // 假設有一個方法來解碼 token 並獲取 memberId

            if (string.IsNullOrEmpty(memberId))
            {
                return Unauthorized();
            }
            System.Diagnostics.Debug.WriteLine($"Fetching user history for memberId: {memberId}");

            var userHistory = _userHistoryService.GetUserHistoryByMemberId(memberId);
            if (userHistory == null || !userHistory.Any())
            {
                return NotFound();
            }
            return Ok(userHistory);
        }

        private string GetMemberIdFromToken(string token)
        {
            try
            {
                // 解碼 token
                var ticket = FormsAuthentication.Decrypt(token);
                if (ticket == null)
                {
                    return null;
                }

                // 假設 email 是 memberId，根據你的需求調整
                var email = ticket.Name;

                // 根據 email 獲取 memberId
                var member = _userHistoryService.GetMemberByEmail(email);
                return member?.Id.ToString();
            }
            catch
            {
                return null;
            }
        }

        [HttpPost]
        [Route("RateOrder")]
        public IHttpActionResult RateOrder([FromBody] RateOrderDto rateOrderDto)
        {
            if (rateOrderDto == null || rateOrderDto.OrderId <= 0 || rateOrderDto.Rating < 1 || rateOrderDto.Rating > 5)
            {
                return BadRequest("Invalid rating data.");
            }

            var result = _userHistoryService.RateOrder(rateOrderDto.OrderId, rateOrderDto.Rating);
            if (!result)
            {
                return InternalServerError();
            }

            return Ok();
        }
		[HttpGet]
		[Route("OrderDetails/{orderNumber}")]
		public IHttpActionResult GetOrderDetails(string orderNumber)
		{
			var orderDetails = _userHistoryService.GetUserHistoryDetail(orderNumber);
			if (orderDetails == null)
			{
				return NotFound();
			}
			return Ok(orderDetails);
		}

		[HttpPost]
		[Route("CancelOrder")]
		public IHttpActionResult CancelOrder([FromBody] CancelOrderDto cancelOrderDto)
		{
			if (cancelOrderDto == null || cancelOrderDto.OrderId <= 0 || string.IsNullOrEmpty(cancelOrderDto.MemberId))
			{
				return BadRequest("Invalid order data.");
			}

			var result = _userHistoryService.CancelOrder(cancelOrderDto.OrderId, cancelOrderDto.MemberId);
			if (!result)
			{
				return InternalServerError(new Exception("Failed to cancel the order."));
			}

			return Ok("Order cancelled successfully.");
		}
	}
}
