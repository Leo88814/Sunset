using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Repositories;
using Sunset.WebAPI.Site.Services;
using System;
using System.Linq;
using System.Web.Http;
using Sunset.WebAPI.Site.Models.Dtos;
using System.Web.Security;
using Sunset.WebAPI.Site.Models.Services;

namespace Sunset.WebAPI.Site.Controllers.Api
{
    [RoutePrefix("api/MemberApiController")]
    public class MemberApiController : ApiController
    {
        private readonly UserHistoryService _userHistoryService;
        private readonly TransactionHistoryService _transactionHistoryService;

        public MemberApiController()
        {
            _userHistoryService = new UserHistoryService(new UserHistoryRepository(new AppDbContext()));
            _transactionHistoryService = new TransactionHistoryService();
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
            var memberId = GetMemberIdFromToken(token);

            if (string.IsNullOrEmpty(memberId))
            {
                return Unauthorized();
            }

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
                var ticket = FormsAuthentication.Decrypt(token);
                if (ticket == null)
                {
                    return null;
                }

                var email = ticket.Name;
                var member = _userHistoryService.GetMemberByEmail(email);
                return member?.Id.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error decoding token: {ex.Message}");
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



        [HttpPost]
        [Route("CancelOrder")]
        public IHttpActionResult CancelOrder([FromBody] CancelOrderDto cancelOrderDto)
        {
            if (cancelOrderDto == null || cancelOrderDto.OrderId <= 0)
            {
                return BadRequest("Invalid order data.");
            }

            var authHeader = Request.Headers.Authorization;
            if (authHeader == null || authHeader.Scheme != "Bearer")
            {
                return Unauthorized();
            }

            var token = authHeader.Parameter;
            var memberId = GetMemberIdFromToken(token);

            if (string.IsNullOrEmpty(memberId))
            {
                return Unauthorized();
            }

            var result = _userHistoryService.CancelOrder(cancelOrderDto.OrderId, memberId);
            if (!result)
            {
                return InternalServerError(new Exception("Failed to cancel the order."));
            }

            return Ok("Order cancelled successfully.");
        }

        [HttpGet]
        [Route("TopupHistory")]
        public IHttpActionResult TopupHistory()
        {
            var authHeader = Request.Headers.Authorization;
            if (authHeader == null || authHeader.Scheme != "Bearer")
            {
                return Unauthorized();
            }

            var token = authHeader.Parameter;
            var memberId = GetMemberIdFromToken(token);

            if (string.IsNullOrEmpty(memberId))
            {
                return Unauthorized();
            }

            var (topupHistory, currentBalance) = _transactionHistoryService.GetTopupHistoryByMemberId(memberId);

            if (topupHistory == null || !topupHistory.Any())
            {
                return NotFound();
            }

            return Ok(new { CurrentBalance = currentBalance, TopupHistory = topupHistory });
        }

        [HttpPost]
        [Route("Topup")]
        public IHttpActionResult Topup([FromBody] TopupDto request)
        {
            var authHeader = Request.Headers.Authorization;
            if (authHeader == null || authHeader.Scheme != "Bearer")
            {
                return Unauthorized();
            }

            var token = authHeader.Parameter;
            var memberId = GetMemberIdFromToken(token);
            if (memberId == null)
            {
                return Unauthorized();
            }

            using (var db = new AppDbContext())
            {
                var memberIdInt = int.Parse(memberId);
                var member = db.Members.Find(memberIdInt);
                if (member == null)
                {
                    return NotFound();
                }

                member.CurrentBalance += request.Amount;

                var orderNumber = _transactionHistoryService.GenerateOrderNumber();

                var topup = new Topup
                {
                    MemberId = memberIdInt,
                    TopUpAmount = request.Amount,
                    OrderTime = DateTime.Now,
                    OrderNumber = orderNumber
                };
                db.Topups.Add(topup);

                db.SaveChanges();

                return Ok(new { newBalance = member.CurrentBalance });
            }
        }

        [HttpPost]
        [Route("UpdateBalance")]
        public IHttpActionResult UpdateBalance([FromBody] UserHistoryDto updateBalanceDto)
        {
            if (updateBalanceDto == null || updateBalanceDto.Amount <= 0)
            {
                return BadRequest("Invalid balance update data.");
            }

            var authHeader = Request.Headers.Authorization;
            if (authHeader == null || authHeader.Scheme != "Bearer")
            {
                return Unauthorized();
            }

            var token = authHeader.Parameter;
            var memberId = GetMemberIdFromToken(token);

            if (string.IsNullOrEmpty(memberId))
            {
                return Unauthorized();
            }

            using (var db = new AppDbContext())
            {
                var memberIdInt = int.Parse(memberId);
                var member = db.Members.Find(memberIdInt);
                if (member == null)
                {
                    return NotFound();
                }

                member.CurrentBalance += updateBalanceDto.Amount;
                db.SaveChanges();

                return Ok(new { newBalance = member.CurrentBalance });
            }
        }

        [HttpPost]
        [Route("OrderDetails")]
        public IHttpActionResult GetOrderDetails([FromBody] UserHistoryDto request)
        {
            if (request == null || string.IsNullOrEmpty(request.OrderNumber))
            {
                return BadRequest("Invalid order number.");
            }

            var authHeader = Request.Headers.Authorization;
            if (authHeader == null || authHeader.Scheme != "Bearer")
            {
                return Unauthorized();
            }

            var token = authHeader.Parameter;
            var memberId = GetMemberIdFromToken(token);

            if (string.IsNullOrEmpty(memberId))
            {
                return Unauthorized();
            }

            var orderDetails = _userHistoryService.GetUserHistoryDetail(request.OrderNumber);
            if (orderDetails == null)
            {
                return NotFound();
            }
            return Ok(orderDetails);
        }
    }
}