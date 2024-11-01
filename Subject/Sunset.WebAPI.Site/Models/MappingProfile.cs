﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using AutoMapper;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Models.ViewModels;


namespace Sunset.WebAPI.Site.Models
{
    public class MappingProfile : Profile
    {
        public MappingProfile() 
        {
            CreateMap<MemberLoginVm, MemberLoginDto>();
            CreateMap<RegisterVm, RegisterDto>();
            CreateMap<MemberLoginVm, CheckMemberLoginDto>();
	      
			CreateMap<Member, CheckMemberLoginDto>().ReverseMap();
			CreateMap<ChangePasswordVm, ChangePasswordDto>();

		}
    }
}