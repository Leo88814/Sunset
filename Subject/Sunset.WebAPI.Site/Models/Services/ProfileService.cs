using AutoMapper;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
    public class ProfileService
    {
        private readonly ProfileRepository _profileRepository;

        public ProfileService(ProfileRepository profileRepository)
        {
            _profileRepository = profileRepository;
        }

        public async Task<bool> UpdateProfileAsync(ProfileDto profileDto)
        {
            // 將 ProfileDto 轉換為 Member
            var member = new Member
            {
                Id = profileDto.Id,
                MemberName = profileDto.MemberName,
                PhoneNumber = profileDto.PhoneNumber,
                Address = profileDto.Address,
                DateOfBirth = profileDto.DateOfBirth
            };

            // 在這裡可以添加業務邏輯，例如驗證資料
            return await _profileRepository.UpdateProfileAsync(member);
        }

        public Member GetMemberByEmail(string email)
        {
            return _profileRepository.GetMemberByEmail(email);
        }
    }
}