using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Services;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Sunset.WebAPI.Site.Models.EFModels;
using System.Threading.Tasks;
using System.Web.Security;
using System.Data.Entity.Validation; // 確保包含這個命名空間

namespace Sunset.WebAPI.Site.Controllers.Apis
{
    [RoutePrefix("api/RegisterApiController")]
    public class RegisterApiController : ApiController
    {
        private readonly MemberService _service;
        private readonly ProfileService _profileService;
        public RegisterApiController()
        {
            _service = new MemberService();
            _profileService = new ProfileService(new ProfileRepository(new AppDbContext()));
        }
        [HttpPost]
        public IHttpActionResult RegisterMember(RegisterDto dto)
        {
            _service.Register(dto);

            return Ok(dto);
        }

        [HttpPost]
        [Route("updateProfile")]
        public async Task<IHttpActionResult> UpdateProfile(ProfileDto profileDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
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

            profileDto.Id = int.Parse(memberId);

            try
            {
                var result = await _profileService.UpdateProfileAsync(profileDto);
                if (result)
                {
                    return Ok("Profile updated successfully.");
                }
                return BadRequest("Failed to update profile.");
            }
            catch (DbEntityValidationException ex)
            {
                var errors = ex.EntityValidationErrors
                    .SelectMany(e => e.ValidationErrors)
                    .Select(e => $"{e.PropertyName}: {e.ErrorMessage}")
                    .ToList();

                System.Diagnostics.Debug.WriteLine($"Validation errors: {string.Join(", ", errors)}");
                return BadRequest(string.Join("; ", errors));
            }
            catch (Exception ex)
            {
                // 增加日誌記錄
                System.Diagnostics.Debug.WriteLine($"Error updating profile: {ex.Message}");
                return InternalServerError(ex);
            }
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
                var member = _profileService.GetMemberByEmail(email);
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
