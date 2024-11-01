﻿using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Services;
using Sunset.WebAPI.Site.Repositories;
using Sunset.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Security;

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    public class CheckOrderApiController : ApiController
    {
        private readonly BookTicketsService _service;


        public CheckOrderApiController()
        {
            _service = new BookTicketsService();
        }
        [HttpGet]
        [Route("api/CheckOrderApi/GetMovieScheduleId/{movieId}/{showdateId}/{showtimeId}")]
        public IHttpActionResult GetMovieSchedule(int movieId, int showdateId, int showtimeId)
        {
            var movieSchedule = _service.GetMovieScheduleId(movieId, showdateId, showtimeId);

            if (movieSchedule == null)
            {
                return NotFound();
            }
            return Ok(movieSchedule);
        }

        [HttpGet]
        [Route("api/CheckOrderApi/CheckOrder/{movieScheduleId}/{seats}")]
        public IHttpActionResult CheckCurrentOrder(int movieScheduleId, string seats)
        {

            List<int> seatIds;
            try
            {
                seatIds = seats.Split(',').Select(int.Parse).ToList();
            }
            catch (FormatException)
            {
                return BadRequest("Invalid seat IDs format");
            }

            var checkOrder = _service.CheckOrder(movieScheduleId, seatIds);

            if (checkOrder == null)
            {
                return NotFound();
            }
            return Ok(checkOrder);
        }

        [HttpGet]
        [Route("api/CheckOrderApi/CheckCurrentBalance")]
        public IHttpActionResult CheckCurrentBalance()
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

            var currentBalance = _service.GetCurrentBalance(memberId);

            return Ok(currentBalance);
        }

        [HttpPost]
        [Route("api/CheckOrderApi/PostOrder")]
        public IHttpActionResult PostOrder([FromBody] PostOrderDto dto)
        {
            if (dto == null)
            {
                return BadRequest("Invalid rating data.");
            }
            if (dto.DataForOrder == null )
            {
                return BadRequest("DataForOrder 的數據無效。");
            }

            if (dto.DataForOrderDetail == null)
            {
                return BadRequest("DataForOrderDetail 的數據無效。");
            }

            if (dto.DataForMovieRating == null )
            {
                return BadRequest("DataForMovieRating 的數據無效。");
            }
            if (dto.DataForRemainingBalance == null)
            {
                return BadRequest("DataForMovieRating 的數據無效。");
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

			var result = _service.PostOrder(dto, memberId);

            if (!result)
            {
                return InternalServerError();
            }

            return Ok(result);
        }

        [HttpGet]
        [Route("api/CheckOrderApi/OrderComplete")]
        public IHttpActionResult OrderComplete()
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

            var currentOrder = _service.GetCurrentOrder(memberId);

            return Ok(currentOrder);
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
                var member = _service.GetMemberByEmail(email);
                return member?.Id.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error decoding token: {ex.Message}");
                return null;
            }
        }
    }
}
